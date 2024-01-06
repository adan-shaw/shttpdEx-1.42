# release
CFLAGS= -DNDEBUG -O2

# debug
#CFLAGS= -D_DEBUG -O2 -g3



all:
	echo "make (linux|unix|msvc)"

clean:
	rm -f a.out*

../src/libshttpd.a:
	cd ../src && $(MAKE) unix

linux:
	cd ../src && $(MAKE) linux
	$(CC) $(CFLAGS) example.c -I ../src -L ../src -o example -ldl -lpthread -lshttpd

unix: ../src/libshttpd.a
	$(CC) $(CFLAGS) example.c -I ../src -L ../src -o example -lshttpd

WIN32_LIBS= user32.lib shell32.lib ws2_32.lib advapi32.lib ..\src\shttpd.lib
CL_FLAGS= /MD /DNDEBUG /nologo /Zi /I ..\src

msvc:
	cl $(CL_FLAGS) example.c $(WIN32_LIBS)
	rc dialog.rc
	cl $(CL_FLAGS) example_win32_dialog_app.c dialog.res $(WIN32_LIBS)
