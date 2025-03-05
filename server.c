/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   server.c                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: aleseile <aleseile@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2025/02/26 14:54:49 by aleseile      #+#    #+#                 */
/*   Updated: 2025/03/04 17:27:33 by aleseile      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <signal.h>
#include "libft/libft.h"
#include "ft_printf/ft_printf.h"

void	ft_bin_to_char(int signum, char *c)
{
	if (signum == SIGUSR1)
		*c = (*c << 1) | 1;
	else if (signum == SIGUSR2)
		*c = *c << 1;
}

void	sig_handler(int signum, siginfo_t *info, void *context)
{
	static int	pid = 0;
	static char	c = 0;
	static int	i = 0;

	(void)context;
	if (pid == 0)
		pid = info->si_pid;
	ft_bin_to_char(signum, &c);
	i++;
	if (i == 8)
	{
		i = 0;
		if (c == '\0')
		{
			kill(pid, SIGUSR1);
			pid = 0;
			return ;
		}
		write(1, &c, 1);
		c = 0;
	}
	kill(pid, SIGUSR2);
}

int	main(void)
{
	struct sigaction	sa;

	ft_printf("Server PID: %d\n", getpid());
	sa.sa_flags = SA_RESTART | SA_SIGINFO;
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
	while (1)
		pause();
	return (0);
}
