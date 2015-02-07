#include "name.Class.hpp"

name::name(void) {
}

name::name(name const & src) {
	(void)src;
}

name &	name::operator=(name const & src) {
	(void)src;
	return (*this);
}

name::~name(void) {
}

std::ostream &	operator<<(std::ostream & o, name const & C) {
	(void)C;
	return (o);
}
