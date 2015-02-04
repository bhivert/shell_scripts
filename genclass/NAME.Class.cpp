#include "NAME.Class.hpp"

NAME::NAME(void) {
}

NAME::NAME(NAME const & src) {
	(void)src;
}

NAME &	operator=(NAME const & src) {
	(void)src;
	return (*this);
}

NAME::~NAME(void) {
}

std::ostream &	operator<<(std::ostream & o, NAME const & N) {
	(void)N;
	return (o);
}
