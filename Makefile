# Makefile for building the JAR file

# Compiler and flags
JC = javac
JAR = jar
JD = javadoc
SRC_DIR = ./src
BIN_DIR = ./classes
LIB_DIR = ./lib
JAR_FILE = Velo_Lib.jar
MAIN_CLASS = main.Main

# Targets
.PHONY: all clean

all: $(JAR_FILE)

docs:
	$(JD) -d docs src/*/*.java
$(JAR_FILE): compile
	@echo "Creating JAR file..."
	@$(JAR) cfe $@ $(MAIN_CLASS) -C $(BIN_DIR) .

compile:
	@echo "Compiling source code..."
	@$(JC) -d $(BIN_DIR) $(SRC_DIR)/**/*.java

compile_test: 
	@$(JC) -d classes -sourcepath src -cp ".:lib/junit-platform-console-standalone-1.10.1.jar" test/AllTests/*.java 

test: compile_test
	@java -jar lib/junit-platform-console-standalone-1.10.1.jar -cp classes --select-package AllTests	

clean:
	@echo "Cleaning up..."
	@rm -rf $(BIN_DIR)/*.class
	@rm -f $(JAR_FILE)

run: $(JAR_FILE)
	@echo "Running JAR file..."
	@java -jar $(JAR_FILE)

