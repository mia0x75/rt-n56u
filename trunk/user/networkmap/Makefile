USERDIR = $(ROOTDIR)/user
SHDIR = $(ROOTDIR)/user/shared

EXEC = networkmap
OBJS = function.o networkmap.o

CFLAGS  += -Wall -I. -I$(SHDIR) -I$(SHDIR)/include
CFLAGS  += -s -DNO_PARALLEL
#CFLAGS  += -DDEBUG -DDEBUG_MORE

LDFLAGS += -L$(SHDIR) -lshared

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS) $(CFLAGS)

romfs:
	upx --best $(EXEC)
	$(ROMFSINST) /usr/sbin/$(EXEC)

clean: 
	rm -rf *.o $(EXEC) *~

