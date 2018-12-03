#include <iostream>
#include <vector>
#include <list>
#include <unordered_map>
#include <algorithm>
#include <fstream>
#include <sstream>

class FIFOCache {
public:
    FIFOCache(int capacity) {
        _capacity = capacity;
    }

    bool access(std::string memoryLocation) {
        if(std::find(_cache.begin(), _cache.end(), memoryLocation) != _cache.end())
            return true;
        else {
            if(_cache.size() == _capacity) {
                _cache.pop_back();
            }
            _cache.push_front(memoryLocation);
            return false;
        }
    }

private:
    int _capacity;
    std::list<std::string> _cache;
};

class LRUCache {
public:
    LRUCache(int capacity){
        _capacity = capacity;
    }

    bool access(std::string memoryLocation) {
        auto cachePointer = _cache.find(memoryLocation);
        if(cachePointer != _cache.end()) {
            //It's a HIT
            LRUOrder(cachePointer);
            return true;
        } else {
            if(_cache.size() == _capacity) {
                _cache.erase(_LRU.back());
                _LRU.pop_back();
            }
            _LRU.push_front(memoryLocation);
            _cache.insert({memoryLocation, _LRU.begin()});
            return false;
        }
    }

    void LRUOrder(std::unordered_map<std::string, std::list<std::string>::iterator>::iterator& cachePointer) {
        _LRU.erase(cachePointer->second);
        _LRU.push_front(cachePointer->first);
        cachePointer->second = _LRU.begin();
    }
private:
    int _capacity;
    std::unordered_map<std::string, std::list<std::string>::iterator> _cache;
    std::list<std::string> _LRU;
};

class OptimalCache {
public:
    OptimalCache(int capacity){
        _capacity = capacity;
    }

    bool access(std::pair<std::string, std::vector<std::string>::iterator> memoryLocation, std::vector<std::string>::iterator currentPointer) {
        auto cacheBlock = _cache.find(memoryLocation.first);
        if(cacheBlock == _cache.end()) {
            //Miss
            //Check Cache Capacity
            if(_cache.size() == _capacity) {
                //If full, kick out
                auto itr = _cache.begin();
                std::list<std::pair<int, std::string>> memoryDistance; //Consider using vector;
                for(itr; itr != _cache.end(); itr++) {
                    int dist = std::distance(currentPointer, itr->second);
                    memoryDistance.push_back(std::pair<int, std::string>(dist, itr->first));
                }
                /* std::sort(memoryDistance.begin(), memoryDistance.end()); */
                memoryDistance.sort();
                auto removalEntry = memoryDistance.back();
                _cache.erase(removalEntry.second);
            }
            //Insert
            _cache.insert(memoryLocation);
            //Register Miss
            return false;
        } else {
            //Hit
            //Update Iterator Value
            cacheBlock->second = memoryLocation.second;
            //Register Hit
            return true;
        }
    }
private:
    int _capacity;
    std::unordered_map<std::string, std::vector<std::string>::iterator> _cache;
};

void runLRUCache(int cacheSize, std::string inFile, std::string outFile){

    std::ifstream in(inFile);
    std::ofstream out(outFile);

    std::vector<std::string> cacheAccesses;
    std::vector<bool> cacheHit;

    unsigned long int totalMisses = 0, compulsoryMisses = 0, capacityMisses = 0;

    std::string line;

    LRUCache *cache = new LRUCache(cacheSize);

    while(getline(in, line)) {
        std::string memoryLocation;
        std::stringstream accesses(line);
        while(accesses >> memoryLocation){
            if(std::find(cacheAccesses.begin(), cacheAccesses.end(), memoryLocation) != cacheAccesses.end()){
                //Means that the memory location has been accessed before
                //Any miss is a Capacity Miss
                bool isHit = cache->access(memoryLocation);
                cacheHit.push_back(isHit);
                if(!isHit) {
                    totalMisses     += 1;
                    capacityMisses  += 1;
                }
            } else {
                //Memory Location has never been accessed before, leads to a Compulsory Miss.
                bool isHit = cache->access(memoryLocation);
                totalMisses      += 1;
                compulsoryMisses += 1;
                cacheHit.push_back(isHit);
            }
            cacheAccesses.push_back(memoryLocation);
        }
    }

    out << "TOTAL_ACCESSES = " << cacheAccesses.size() << std::endl;
    out << "TOTAL_MISSES = " << totalMisses << std::endl;
    out << "COMPULSORY_MISSES = " << compulsoryMisses << std::endl;
    out << "CAPACITY_MISSES = " << capacityMisses << std::endl;

    for(std::vector<bool>::iterator itr = cacheHit.begin(); itr != cacheHit.end(); itr++) {
        if(*itr)
            out << "HIT" << std::endl;
        else
            out << "MISS" << std::endl;
    }
}

void runFIFOCache(int cacheSize, std::string inFile, std::string outFile){

    std::ifstream in(inFile);
    std::ofstream out(outFile);

    std::vector<std::string> cacheAccesses;
    std::vector<bool> cacheHit;

    unsigned long int totalMisses = 0, compulsoryMisses = 0, capacityMisses = 0;

    std::string line;

    FIFOCache *cache = new FIFOCache(cacheSize);

    while(getline(in, line)) {
        std::string memoryLocation;
        std::stringstream accesses(line);
        while(accesses >> memoryLocation){
            if(std::find(cacheAccesses.begin(), cacheAccesses.end(), memoryLocation) != cacheAccesses.end()){
                //Means that the memory location has been accessed before
                //Any miss is a Capacity Miss
                bool isHit = cache->access(memoryLocation);
                cacheHit.push_back(isHit);
                if(!isHit) {
                    totalMisses     += 1;
                    capacityMisses  += 1;
                }
            } else {
                //Memory Location has never been accessed before, leads to a Compulsory Miss.
                bool isHit = cache->access(memoryLocation);
                totalMisses      += 1;
                compulsoryMisses += 1;
                cacheHit.push_back(isHit);
            }
            cacheAccesses.push_back(memoryLocation);
        }
    }

    out << "TOTAL_ACCESSES = " << cacheAccesses.size() << std::endl;
    out << "TOTAL_MISSES = " << totalMisses << std::endl;
    out << "COMPULSORY_MISSES = " << compulsoryMisses << std::endl;
    out << "CAPACITY_MISSES = " << capacityMisses << std::endl;

    for(std::vector<bool>::iterator itr = cacheHit.begin(); itr != cacheHit.end(); itr++) {
        if(*itr)
            out << "HIT" << std::endl;
        else
            out << "MISS" << std::endl;
    }
}

void runOptimalCache(int cacheSize, std::string inFile, std::string outFile) {

    std::ifstream in(inFile);
    std::ofstream out(outFile);

    std::vector<std::string> cacheAccesses;
    std::vector<bool> cacheHit;

    std::list<std::pair<std::string, std::vector<std::string>::iterator>> iteratorMap;

    unsigned long int totalMisses = 0, compulsoryMisses = 0, capacityMisses = 0;

    std::string line;

    OptimalCache *cache = new OptimalCache(cacheSize);

    while(getline(in, line)) {
        std::string memoryLocation;
        std::stringstream accesses(line);
        while(accesses >> memoryLocation){
            cacheAccesses.push_back(memoryLocation);
            iteratorMap.push_back(std::pair<std::string, std::vector<std::string>::iterator>(memoryLocation, std::prev(cacheAccesses.end())));
        }
    }

    auto accessItr = cacheAccesses.begin();
    auto itrMapItr = iteratorMap.begin();

    for(accessItr; accessItr != cacheAccesses.end(); accessItr++) {
        bool previouslyAccessed = false;
        //Finding the next existing access
        //If none is found then set to end
        itrMapItr->second = cacheAccesses.end();
        for(auto itr = accessItr + 1; itr != cacheAccesses.end(); itr++){
            if(*accessItr == *itr) {
                itrMapItr->second = itr;
                break;
            }
        }
        //Check to determine the address was accessed before
        for(auto itr = cacheAccesses.begin(); itr != accessItr; itr++){
            if(*accessItr == *itr) {
                previouslyAccessed = true;
                break;
            }
        }
        if(previouslyAccessed){
            //Check Cache
            //If HIT, then push 1 into cacheHit vector
            //Else it's Capacity Miss.
            bool isHit = cache->access(*itrMapItr, accessItr);
            cacheHit.push_back(isHit);
            if(!isHit) {
                totalMisses += 1;
                capacityMisses += 1;
            }
        }
        else {
            //Compulsory Miss, register miss
            bool isHit = cache->access(*itrMapItr, accessItr);
            cacheHit.push_back(isHit);
            totalMisses += 1;
            compulsoryMisses += 1;
        }
        itrMapItr++;
    }

    out << "TOTAL_ACCESSES = " << cacheAccesses.size() << std::endl;
    out << "TOTAL_MISSES = " << totalMisses << std::endl;
    out << "COMPULSORY_MISSES = " << compulsoryMisses << std::endl;
    out << "CAPACITY_MISSES = " << capacityMisses << std::endl;

    for(std::vector<bool>::iterator itr = cacheHit.begin(); itr != cacheHit.end(); itr++) {
        if(*itr)
            out << "HIT" << std::endl;
        else
            out << "MISS" << std::endl;
    }
}

int main(int argc, char** argv) {
    std::string replacementPolicy = argv[1];
    std::string inFile = argv[2];
    int cacheSize = atoi(argv[3]);

    inFile.erase((inFile.length() - 4), 4);

    std::string outFile = "CS17BTECH11042_" + replacementPolicy + "_" + inFile + "_" + argv[3] + ".out";

    if(replacementPolicy == "LRU")
        runLRUCache(cacheSize, argv[2], outFile);
    else if(replacementPolicy == "FIFO")
        runFIFOCache(cacheSize, argv[2], outFile);
    else if(replacementPolicy == "OPTIMAL")
        runOptimalCache(cacheSize, argv[2], outFile);

    return 0;
}
