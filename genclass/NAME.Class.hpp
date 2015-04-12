#ifndef NAME_CLASS_HPP
# define NAME_CLASS_HPP

# include <ostream>

class name {
	public:
		name(void);
		virtual	~name(void);

	protected:
	private:
		name(name const & src);
		name &	operator=(name const & src);
};

std::ostream &	operator<<(std::ostream & o, name const & C);

#endif
