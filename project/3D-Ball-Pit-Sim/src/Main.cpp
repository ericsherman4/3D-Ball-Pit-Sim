#include <iostream>
#include <SFML/Graphics.hpp>

#define COUT(x) std::cout << x << std::endl;

int main()
{
    sf::RenderWindow window(sf::VideoMode(200, 200), "SFML works!");
    sf::CircleShape shape(100.f);
    shape.setFillColor(sf::Color::Green);

    if (!sf::Shader::isAvailable())
    {
        COUT("Shaders not available");
        return -1;
    }

    sf::Shader shader;
    if (!shader.loadFromFile(R"(shaders\vertex_shader.glsl)", R"(shaders\fragment_shader.glsl)"))
    {
        COUT("Could not load shaders");
        return -1;
    }
    
    // Make a vertex buffer for points
    // https://www.sfml-dev.org/documentation/2.6.1/classsf_1_1VertexBuffer.php#details
    sf::VertexBuffer circles(sf::Points, sf::VertexBuffer::Usage::Dynamic);
    circles.create(100);

    // Make a buffer holding points
    sf::Vertex arr[100];
    for (int i = 0; i < 100; i++)
    {
        arr[i].position = sf::Vector2f(float(i), float(i));
    }
    
    


    while (window.isOpen())
    {
        sf::Event event;
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        window.clear();
        //window.draw(shape);
        //window.draw(shape, &shader);
        window.draw(circles, &shader);
        window.display();

    }

    return 0;
}