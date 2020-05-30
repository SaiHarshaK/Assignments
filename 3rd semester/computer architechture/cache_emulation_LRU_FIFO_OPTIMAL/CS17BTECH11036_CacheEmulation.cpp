#include <iostream>
#include <fstream>
#include <vector>
#include <cstring>
#include <string>
#include <sstream>
#include <algorithm>
#include <cstdlib>
#include <queue>

using namespace std;

bool search_for_entry( string& individual_address, vector <string> &cache_entries, int cache_entries_length  ) {

  for (int i = 0 ; i < cache_entries_length ; i++ ) {
    if( cache_entries[i] == individual_address ) { // a hit so we return true
      return true;
    }
  }
  //didnt find a hit so return false
  return false;
}

int find_replaceable( vector <string> &address_all, long int address_all_length, vector <string> &cache_entries, int cache_entries_length, int NumberOfCacheEntries, long int start_index ) {
  int flag = -1; //if not called we replace that entry in cache_entries, if called then will store the the element index with farthest occurence
  long int farthest = start_index; //the element in cache entries which will occur farthest in future.

  for (int i = 0 ; i < cache_entries_length ; i++ ) { // we find an i such that it will contain index of position in cache_entries which can be replaced
    long int j;
    for (j = start_index ; j < address_all_length ; j++ ) {
      if( address_all[j] == cache_entries[i] ) { //exists at j index at future
        if( j > farthest ) {
          farthest = j; //update farthest
          flag = i;
        }

        break;//finding one occurence of this entry in future is enough
      }
    }

    if( j == address_all_length ) { //iterated through all the future elements but did not find any occurence
        return i;
    }
  }

  if( flag != -1 ) {
    return flag;
  }

  //never reaches
  return 0;
}

void optimal_policy( vector <string> &address_all, long int address_all_length, int NumberOfCacheEntries, vector <int> &address_all_unique, long int* capacity_misses, vector <int> &hit_miss ) {
  vector <string> cache_entries;
  //check for hit
  for (long int i = 0; i < address_all_length; i++ ) {
    int cache_entries_length = cache_entries.size();

    if( search_for_entry( address_all[i], cache_entries, cache_entries_length ) ) { //hit
      hit_miss.push_back(1);
      continue; //do nothing
    }
    //check if capacity miss since it is not a hit.
    else if( address_all_unique[i] == 0 ) { //is not unique, so capacity miss
      (*capacity_misses)++;
    }
    hit_miss.push_back(0);

    //number of cache entries are not full
    if( cache_entries_length < NumberOfCacheEntries ) {
      cache_entries.push_back( address_all[i] );
    } else { // we need to replace a entry since all entries are in full
      int pos_replaceable = find_replaceable( address_all, address_all_length, cache_entries, cache_entries_length, NumberOfCacheEntries, (i + 1) );
      cout<<cache_entries[pos_replaceable]<<endl;
      cache_entries[pos_replaceable] = address_all[i];
    }
  }
}

int main(int argc, char const *argv[])
{
  //intialize
  int flag = 0,flag_queue_hit = 0;
  string line;
  long int total_accesses = 0, total_misses = 0, compulsory_misses = 0, capacity_misses = 0;
  int NumberOfCacheEntries = atoi(argv[3]);

  //identify replacement policy
  switch( argv[1][0] ) {
    case 'L':
      flag = 1;
      break;
    case 'F':
      flag = 2;
      break;
    case 'O':
      flag = 3;
      break;
  }

  //read from input file
  ifstream inputFile;
  inputFile.open(argv[2]);
  //initialize
  deque <string> addresses_fifo;
  vector <string> addresses; //will contain all the addresses for the cache.
  vector <string> unique_addresses; // unique addresses are stored here
  vector <long int> addresses_rank(NumberOfCacheEntries);
  vector <int> hit_miss;
  vector <string>::iterator it_s;
  vector <long int>::iterator it_i;
  for( int i = 0; i < NumberOfCacheEntries; i++ ) { //assign initial ranks
    addresses_rank[i] = i;
  }

  if( flag == 1 || flag == 2 ) {
    while( getline( inputFile, line ) ) {
      vector <string> address_line;//will store individual addresses per line
      stringstream iss(line);
      string individual_address;
      while( iss >> individual_address ) {
        address_line.push_back( individual_address );
      }

      int flag_unique = 0;
      long int address_line_length = address_line.size();
      for ( long int i = 0; i < address_line_length ; i++ ) {
        total_accesses++;

        it_s = find (unique_addresses.begin(), unique_addresses.end(), address_line[i]);
        if( it_s == unique_addresses.end() ) { //address is being read for the first time
          compulsory_misses++;
          unique_addresses.push_back( address_line[i] );
          hit_miss.push_back(0);
          flag_unique = 1;
        }

        if( flag == 1 ) { //LRU policy
          if( flag_unique == 1 ) {
            // decrease rank of all other elements by 1 and replace least recently used block, rank -1(0 becomes -1 after decrement)
            for(long int j = 0; j < NumberOfCacheEntries; j++ ) {
              addresses_rank[j]--;
            }
            it_i = find (addresses_rank.begin(), addresses_rank.end(), -1);
            addresses_rank[it_i - addresses_rank.begin()] = NumberOfCacheEntries - 1;
            if( addresses.size() < NumberOfCacheEntries ) { // if all blocks are not filled we add the new block
              addresses.push_back( address_line[i] );
            } else { //filled so replace the LRU block
              addresses[it_i - addresses_rank.begin()] = address_line[i];
            }

          } else { //capacity miss or hit
            it_s = find (addresses.begin(), addresses.end(), address_line[i]);
            if( it_s == addresses.end() ) { //address is capacity miss
              capacity_misses++;
              hit_miss.push_back(0);
              // decrease rank of all other elements by 1 and replace least recently used block, rank -1(0 becomes -1 after decrement)
              for(long int j = 0; j < NumberOfCacheEntries; j++ ) {
                addresses_rank[j]--;
              }
              it_i = find (addresses_rank.begin(), addresses_rank.end(), -1);
              addresses_rank[it_i - addresses_rank.begin()] = NumberOfCacheEntries - 1;
              addresses[it_i - addresses_rank.begin()] = address_line[i];//replace the least recently used block

            } else { // a hit
              hit_miss.push_back(1);
              // decrease rank of all other elements by 1 and replace least recently used block, rank -1(0 becomes -1 after decrement)
              it_s = find (addresses.begin(), addresses.end(), address_line[i]);//find the address position

              //addresses[it_s] = address_line[i];//replace the least recently used block, no need to
              //ranks below prev rank of recent block will stay the same, higher ones are reduced by 1, update the recently used block's rank
              for(long int j = 0; j < NumberOfCacheEntries; j++ ) {
                if( addresses_rank[j] > addresses_rank[it_s - addresses.begin()] ) {
                  addresses_rank[j]--;
                } // else do nothing
              }
              addresses_rank[it_s - addresses.begin()] = NumberOfCacheEntries - 1; // update the recently used block's rank
            }
          }

        } else if( flag == 2 ) { //FIFO policy
          if( flag_unique == 1 ) { //compulsory miss
            addresses_fifo.push_back( address_line[i] );
            if( addresses_fifo.size() > NumberOfCacheEntries ) { // if all blocks are not filled we add the new block
              addresses_fifo.pop_front();
            }
          } else {
            long int addresses_fifo_length = addresses_fifo.size();
            for(long int j = 0; (j < NumberOfCacheEntries) || (j < addresses_fifo_length ); j++ ) {
              if( addresses_fifo[j] == address_line[i] ) { // hit
                hit_miss.push_back(1);
                flag_queue_hit = 1;
                break;
              }
            }
            if(flag_queue_hit == 0) { //capacity miss
              capacity_misses++;
              hit_miss.push_back(0);
              addresses_fifo.push_back( address_line[i] );
              if( addresses_fifo.size() > NumberOfCacheEntries ) { // if all blocks are not filled we add the new block
                addresses_fifo.pop_front();
              }
            }
          }

        }
        //reset
        flag_unique = 0;
        flag_queue_hit = 0;
      }

    }
  } else { //optimal policy
    vector <string> address_all;//will store all individual addresses from file
    vector <int> address_all_unique;//1 is unique, else 0 for checking if compulsory miss or capacity miss
    //here address_line will store all the addresses
    while( getline( inputFile, line ) ) {
      stringstream iss(line);
      string individual_address;
      while( iss >> individual_address ) { //also count compulsory misses while we store all the addresses
        it_s = find (address_all.begin(), address_all.end(), individual_address);
        if( it_s == address_all.end() ) { //address is being read for the first time
          compulsory_misses++;
          address_all_unique.push_back(1);
        } else { //address is not unique -> can be hit or capacity miss
          address_all_unique.push_back(0);
        }
        address_all.push_back( individual_address );
        total_accesses++;
      }
    }
    //all addresses are now stored
    long int address_all_length = address_all.size();
    optimal_policy( address_all, address_all_length, NumberOfCacheEntries, address_all_unique, &capacity_misses, hit_miss );//will handle optimal policy algo
  }

  inputFile.close();
  ofstream outputFile;
  string policy(argv[1]);
  string inputFile_name(argv[2]);
  size_t period_index = inputFile_name.find_last_of(".");
  string inputFile_name_no_extension = inputFile_name.substr(0, period_index);
  stringstream NumberOfCacheEntries_s;
  NumberOfCacheEntries_s << NumberOfCacheEntries;
  string outputFile_name = "CS17BTECH11036_" + policy + "_" + inputFile_name_no_extension + "_" + NumberOfCacheEntries_s.str() + ".out";
  int n = outputFile_name.length();
  char char_array[n+1];
  strcpy(char_array, outputFile_name.c_str());
  outputFile.open( char_array );
  outputFile << "TOTAL_ACCESSES = "<< total_accesses << endl;
  total_misses = capacity_misses + compulsory_misses;
  outputFile << "TOTAL_MISSES = " << total_misses << endl;
  outputFile << "COMPULSORY_MISSES = " << compulsory_misses << endl;
  outputFile << "CAPACITY_MISSES = " << capacity_misses <<endl;
  for (long int i = 0; i < total_accesses; i++ ) {
    if(hit_miss[i] == 1) {
      outputFile << "HIT" <<endl;
    } else {
      outputFile << "MISS" <<endl;
    }
  }
  outputFile.close();
  return 0;
}
