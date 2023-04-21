

switch (powerup_type) {
    case 1:
        draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_fuchsia, 1);
        break;
    case 2:
        // code here
        draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_fuchsia, 1);
        draw_sprite_ext(sprite_index, 1, x, y, 1, 1, 0, c_white, 1);
        break;
    case 3:
        draw_sprite_ext(sprite_index, 2, x, y, 1, 1, 0, c_orange, 1);
        break;
    case 4:
        draw_sprite_ext(sprite_index, 3, x, y, 1, 1, 0, c_orange, 1);
        break;
    default:
        break;
}
