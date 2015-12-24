TARGET=../../bin/OSX/Ultra-Fighters.app/Contents/MacOS/Ultra-Fighters.osx
C_FLAGS=-Wall -pedantic -I../../include/ -DDEBUG=1
COMPILE_C=gcc $(C_FLAGS) -std=c11 -c $<
COMPILE_CPP=g++ $(C_FLAGS) -std=c++1y -c $<
OBJECTS=game_node.o game_scene.o hud.o logger.o loop.o main.o miscutils.o myglutils.o physics_body.o player.o projectile.o wavefront_object.o
RES_SOURCE=../../Resources
RES_DEST=../../bin/OSX/Ultra-Fighters.app/Contents/Resources
LIB_FLAGS=../../lib/OSX/libGLEW.a ../../lib/OSX/libglfw3.a -framework OpenGL -framework CoreVideo -framework Cocoa -framework IOKit

all: $(TARGET) $(RES_DEST)

$(TARGET): $(OBJECTS)
	g++ $^ -o $@ $(LIB_FLAGS)

game_node.o: ../../src/game_node.cpp ../../src/miscutils.hpp ../../src/loop.hpp ../../src/logger.h ../../src/game_node.hpp
	$(COMPILE_CPP)

game_scene.o: ../../src/game_scene.cpp ../../src/game_scene.hpp ../../src/loop.hpp ../../src/player.hpp ../../src/miscutils.hpp ../../src/logger.h ../../src/physics_body.hpp ../../src/game_node.hpp ../../src/myglutils.h
	$(COMPILE_CPP)

hud.o: ../../src/hud.cpp ../../src/game_scene.hpp ../../src/loop.hpp ../../src/player.hpp ../../src/logger.h ../../src/hud.hpp ../../src/physics_body.hpp ../../src/game_node.hpp ../../src/myglutils.h
	$(COMPILE_CPP)

logger.o: ../../src/logger.c ../../src/logger.h
	$(COMPILE_C)

loop.o: ../../src/loop.cpp ../../src/loop.hpp ../../src/logger.h
	$(COMPILE_CPP)

main.o: ../../src/main.cpp ../../src/game_scene.hpp ../../src/loop.hpp ../../src/player.hpp ../../src/logger.h ../../src/wavefront_object.hpp ../../src/hud.hpp ../../src/physics_body.hpp ../../src/game_node.hpp ../../src/myglutils.h
	$(COMPILE_CPP)

miscutils.o: ../../src/miscutils.cpp ../../src/miscutils.hpp ../../src/loop.hpp ../../src/logger.h ../../src/game_node.hpp
	$(COMPILE_CPP)

myglutils.o: ../../src/myglutils.c ../../src/getline.h ../../src/logger.h ../../src/myglutils.h
	$(COMPILE_C)

physics_body.o: ../../src/physics_body.cpp ../../src/physics_body.hpp
	$(COMPILE_CPP)

player.o: ../../src/player.cpp ../../src/game_scene.hpp ../../src/loop.hpp ../../src/player.hpp ../../src/miscutils.hpp ../../src/logger.h ../../src/physics_body.hpp ../../src/projectile.hpp ../../src/game_node.hpp ../../src/myglutils.h
	$(COMPILE_CPP)

projectile.o: ../../src/projectile.cpp ../../src/game_scene.hpp ../../src/loop.hpp ../../src/player.hpp ../../src/logger.h ../../src/physics_body.hpp ../../src/projectile.hpp ../../src/game_node.hpp ../../src/myglutils.h
	$(COMPILE_CPP)

wavefront_object.o: ../../src/wavefront_object.cpp ../../src/game_scene.hpp ../../src/loop.hpp ../../src/player.hpp ../../src/wavefront_object.hpp ../../src/logger.h ../../src/physics_body.hpp ../../src/game_node.hpp ../../src/myglutils.h
	$(COMPILE_CPP)

.PHONY: $(RES_DEST) clean

$(RES_DEST):
	rm -rf $@
	cp -R $(RES_SOURCE) $@

clean:
	rm -f $(OBJECTS)
