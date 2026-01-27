SHARED_LIBRARIES := $(wildcard *.so)
CACHE_FILES := build build.ninja CMakeFiles CMakeCache.txt $(wildcard *.cmake) $(wildcard .ninja_*)


.PHONY: delete

delete: $(SHARED_LIBRARIES) $(CACHE_FILES)
	rm -rf $(SHARED_LIBRARIES) $(CACHE_FILES)
