#ifndef NAME_CLASS_HPP
# define NAME_CLASS_HPP

# include <iostream>

class NAME {
	private:
	protected:
	public:
		NAME(void);
		NAME(NAME const & src);
		NAME &	operator=(NAME const & src);
		virtual	~NAME(void);
}

std::ostream	operator<<(std::ostream & o, NAME const & N);

#endif
