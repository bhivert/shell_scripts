#ifndef __NAME_HPP__
# define __NAME_HPP__

/*!
@file name.hpp
@brief ...
*/

# include <ostream>
# include <string>

class name {
	public:
		name(void);
		virtual	~name(void);

		const std::string	to_string(void) const;

	protected:
	private:
		name(const name &src) = delete;
		name(name &&src) = delete;

		name &	operator=(const name &src) = delete;
		name &	operator=(name &&src) = delete;
};

std::ostream &	operator<<(std::ostream &o, const name &C);

#endif
