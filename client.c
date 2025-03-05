/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   client.c                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: aleseile <aleseile@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2025/02/26 14:54:52 by aleseile      #+#    #+#                 */
/*   Updated: 2025/03/04 17:17:58 by aleseile      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <signal.h>
#include "libft/libft.h"
#include "ft_printf/ft_printf.h"

static int	g_receiver = 0;

void	sig_handler(int signum, siginfo_t *info, void *context)
{
	static int	i = 0;

	(void)info;
	(void)context;
	g_receiver = 1;
	if (signum == SIGUSR2)
		i++;
	else if (signum == SIGUSR1)
		ft_printf("Number of bytes received: %d\n", i / 8);
}

void	ft_char_to_bin(char c, int pid)
{
	int	bit_index;
	int	itr;

	bit_index = 7;
	while (bit_index >= 0)
	{
		if ((c >> bit_index) & 1)
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		itr = 0;
		while (g_receiver == 0)
		{
			if (itr == 50)
			{
				ft_printf("No response from server.\n");
				exit(1);
			}
			itr++;
			usleep(100);
		}
		g_receiver = 0;
		bit_index--;
	}
}

void	send_binary_data(char *data, int pid)
{
	int	byte_index;

	byte_index = 0;
	while (data[byte_index] != '\0')
	{
		ft_char_to_bin(data[byte_index], pid);
		byte_index++;
	}
	ft_char_to_bin('\0', pid);
}

int	main(int argc, char *argv[])
{
	struct sigaction	sa;
	int					pid;

	if (argc != 3)
	{
		ft_printf("You need to pass 2 args, but you passed %d\n", argc - 1);
		return (1);
	}
	pid = ft_atoi(argv[1]);
	sa.sa_flags = SA_SIGINFO;
	sa.sa_sigaction = sig_handler;
	if (sigaction(SIGUSR1, &sa, NULL) == -1)
	{
		perror("sigaction");
		return (1);
	}
	else if (sigaction(SIGUSR2, &sa, NULL) == -1)
	{
		perror("sigaction");
		return (1);
	}
	send_binary_data(argv[2], pid);
	return (0);
}
