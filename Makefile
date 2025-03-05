CC = gcc
CFLAGS = -Wall -Wextra -Werror

# Sources and objects
SRCS_SERVER = server.c
SRCS_CLIENT = client.c
OBJS_SERVER = $(SRCS_SERVER:.c=.o)
OBJS_CLIENT = $(SRCS_CLIENT:.c=.o)
LIBFT_DIR = libft
LIBFT_REPO = https://github.com/wastedbitch/42_libft
LIBFT = $(LIBFT_DIR)/libft.a

FT_PRINTF_DIR = ft_printf
FT_PRINTF_REPO = https://github.com/wastedbitch/42_printf.git
FT_PRINTF = $(FT_PRINTF_DIR)/libftprintf.a

# Output executables
EXEC_SERVER = server
EXEC_CLIENT = client

# Default target
all: $(EXEC_SERVER) $(EXEC_CLIENT)

# Clone and compile libft
$(LIBFT_DIR)/libft.a:
	@if [ ! -d "$(LIBFT_DIR)" ]; then \
		git clone $(LIBFT_REPO) $(LIBFT_DIR); \
	fi
	$(MAKE) -C $(LIBFT_DIR)

# Clone and compile ft_printf
$(FT_PRINTF_DIR)/libftprintf.a:
	@if [ ! -d "$(FT_PRINTF_DIR)" ]; then \
		git clone $(FT_PRINTF_REPO) $(FT_PRINTF_DIR); \
	fi
	$(MAKE) -C $(FT_PRINTF_DIR)

# Compile server
$(EXEC_SERVER): $(LIBFT) $(FT_PRINTF) $(OBJS_SERVER)
	$(CC) $(CFLAGS) $(OBJS_SERVER) -o $(EXEC_SERVER) -L$(LIBFT_DIR) -L$(FT_PRINTF_DIR) -lft -lftprintf

# Compile client
$(EXEC_CLIENT): $(OBJS_CLIENT) $(LIBFT) $(FT_PRINTF)
	$(CC) $(CFLAGS) $(OBJS_CLIENT) -o $(EXEC_CLIENT) -L$(LIBFT_DIR) -L$(FT_PRINTF_DIR) -lft -lftprintf

# Clean up object files, executables, and libraries
clean:
	rm -f $(OBJS_SERVER) $(OBJS_CLIENT)
	$(MAKE) -C $(LIBFT_DIR) clean
	$(MAKE) -C $(FT_PRINTF_DIR) clean

# Remove everything
fclean: clean
	rm -f $(EXEC_SERVER) $(EXEC_CLIENT)
	$(MAKE) -C $(LIBFT_DIR) fclean
	$(MAKE) -C $(FT_PRINTF_DIR) fclean
	rm -rf $(LIBFT_DIR) $(FT_PRINTF_DIR)

# Rebuild everything
re: fclean all

.PHONY: all clean fclean re
