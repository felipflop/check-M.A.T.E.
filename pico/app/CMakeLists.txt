add_executable(app
    main.c
)

target_link_libraries(app pico_stdlib)

pico_add_extra_outputs(app)