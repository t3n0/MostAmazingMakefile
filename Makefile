###############################################################################
#                                                                             #
#             THE definitive makefile for simple c++ projects                 #
#                       Without scassamento di maroni!                        #
#                                                                             #
##################################### Usage ###################################
#                                                                             #
# 1) Place this makefile in the same folder as the main.cpp file              #
# 2) Specify the location of the dependency files (SRC_DIRS)                  #
# 3) Edit executable name, compiler flags and the like (optional)             #
# 4) Run make all                                                             #
#                                                                             #
############################## Editable settings ##############################

SRC_DIRS := .
EXE      := a.out
ARCHIVE  := lib.a
FLAGS    := -std=c++17 -Wall -flto -O3 
CXX      := g++
AR       := gcc-ar
ARFLAGS  := rvs

###############################################################################



####################### Do not edit below this point ##########################

# sources, objects and headers from the base directory
AR_SRCS := $(shell find $(SRC_DIRS) -type f \( -name "*.cpp" -not -name "main.cpp"  \) -print)
AR_OBJS := $(AR_SRCS:%.cpp=%.o)
HDRS := $(AR_SRCS:%.cpp=%.hpp)

# same as above plus main.cpp
SRCS := $(AR_SRCS) main.cpp
OBJS := $(SRCS:%.cpp=%.o)
DEPS := $(OBJS:.o=.d)

# folders to include with -I
INC_DIRS := $(shell find $(SRC_DIRS) -type d \( -not -name "include" -and -not -name "." \) -print)
INC_FLAGS := $(addprefix -I ,$(INC_DIRS))

# c++ flags, -I and automatic dependency generator
CPPFLAGS := $(FLAGS) $(INC_FLAGS) -MMD -MP

########################### Makefile rules start here ########################

default :
	@echo 'The most amazing makefile for compiling simple c++ projects.'
	@echo 'It does everything for you, without scassamento di maroni!'
	@echo 'Typing "make" with no arguments displays this message.'
	@echo 'Specific targets for compiling are:'
	@echo '  all       compiles the whole project'
	@echo '  ar        creates a static library and'
	@echo '            collects headers in the "include" folder'
	@echo '  clean     removes executable, objects, archive and dependencies'

.PHONY: clean

all : $(EXE)

$(EXE) : $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LDFLAGS)

-include $(DEPS)

ar : $(ARCHIVE)
	@mkdir -p include; cp $(HDRS) include/

$(ARCHIVE) : $(AR_OBJS)
	$(AR) $(ARFLAGS) $@ $^

clean :
	@rm -f $(OBJS) $(EXE) $(ARCHIVE) $(DEPS)

