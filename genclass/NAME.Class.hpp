#ifndef NAME_CLASS_HPP
# define NAME_CLASS_HPP

# include <ostream>

class name {
	private:
	protected:
	public:
		name(void);
		name(name const & src);
		name &	operator=(name const & src);
		virtual	~name(void);
};

std::ostream &	operator<<(std::ostream & o, name const & C);

#endif
