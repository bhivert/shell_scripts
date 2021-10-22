#ifndef NAME_H
# define NAME_H

# include <ostream>

class name {
	public:
		name(void);
		virtual	~name(void);

	protected:
	private:
		name(name const & src);
		name &	operator=(const name & src);

		friend std::ostream &	operator<<(std::ostream & o, const name & C);
};

std::ostream &	operator<<(std::ostream & o, const name & C);

#endif
