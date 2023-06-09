#include <iostream>

#include <miroir/type.hpp>
#include <miroir/ostream.hpp>
#include <assert.h>

struct position
{
    float x;
    float y;
    
    void move(float x_offset = 0, float y_offset = 0)
    {
        x += x_offset;
        y += y_offset;
    }
    
    // Reflects the class
    using type_info = miroir::type_info<position>
        ::with_name<"position">
        
        ::with_field<&position::x, "x">
        ::with_field<&position::y, "y">
        
        ::with_method<&position::move, "move">;
};

int main()
{
    position pos{};

   // std::cout << pos << std::endl;
    
    constexpr miroir::const_string x = "x";

    // Gets `y` field then sets `y` of `pos` to 8.
    miroir::get_field_info<position, "y">::set(pos, 8);
    miroir::set<"x">(pos, 4.2f);
    
    // Gets `move` method then call it from `pos`.
    miroir::get_method_info<position, "move">::invoke(pos, 4, -4);
    miroir::invoke<"move">(pos, 4, -4);
    
    auto pos_x = pos.x;
    
    miroir::set<x>(pos, 4.2f);

    std::cout << x << pos_x << std::endl;

    static_assert(x == "x", "expected x");
    assert(pos_x == 12.2f);
    

    std::cin.get();
    
    return 0;
}
