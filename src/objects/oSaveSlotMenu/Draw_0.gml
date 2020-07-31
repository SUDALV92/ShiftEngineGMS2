draw_set_halign( fa_left );
draw_set_valign( fa_center );
draw_set_font( fMenuDescriptionFont );
var bgRectWidth = 530;
var bgRectHeight = 210;

var slotWidth = 160;
var slotHeight = 130;

var textLMargin = 15;
var textTMargin = 10;
var tickMargin = 23;

var lineHeight = 32;
var slotHeaderMargin = 15; 

var slotHMargin = ( bgRectWidth - 3 * slotWidth ) / 4;
var slotVMargin = slotHMargin;

// Slot bounding rectangle.
var rectL = x - bgRectWidth / 2;
var rectR = x + bgRectWidth / 2;
var rectT = y - bgRectHeight / 2;
var rectB = y + bgRectHeight / 2;
draw_set_color( MenuBgColor );
draw_rectangle( rectL, rectB, rectR, rectT, false );
draw_set_color( MenuBorderColor );
draw_rectangle( rectL, rectB, rectR, rectT, true );

// Slot inner rectangles.
var slotT = rectT + slotVMargin;
var slotB = slotT + slotHeight;
var slot1L = rectL + slotHMargin;
var slot1R = slot1L + slotWidth;
var slot1Color = MenuBorderColor;
if( ActiveSlotIndex == 1 && ActiveOptionPos == 0 ) {
    slot1Color = ActiveSlotColor;
}
var slot2Color = MenuBorderColor;
if( ActiveSlotIndex == 2 && ActiveOptionPos == 0 ) {
    slot2Color = ActiveSlotColor;
}
var slot3Color = MenuBorderColor;
if( ActiveSlotIndex == 3 && ActiveOptionPos == 0 ) {
    slot3Color = ActiveSlotColor;
}
var slot2L = slot1R + slotHMargin;
var slot2R = slot2L + slotWidth;
var slot3L = slot2R + slotHMargin;
var slot3R = slot3L + slotWidth;
draw_set_color( SlotBgColor );
draw_rectangle( slot1L, slotB, slot1R, slotT, false );
draw_rectangle( slot2L, slotB, slot2R, slotT, false );
draw_rectangle( slot3L, slotB, slot3R, slotT, false );
draw_set_color( slot1Color );
draw_rectangle( slot1L, slotB, slot1R, slotT, true );
draw_set_color( slot2Color );
draw_rectangle( slot2L, slotB, slot2R, slotT, true );
draw_set_color( slot3Color );
draw_rectangle( slot3L, slotB, slot3R, slotT, true );

// Slot information.
for( var i = 0; i < 3; i++ ) {
    var slotX = slot1L + i * ( slotWidth + slotHMargin );
    var slotTextY = slotT + textTMargin + lineHeight / 2;
    var slotIndex = i + 1;
    var textColor = SlotTextColor;
    var slotName = "Slot " + string( slotIndex );
    var slotCenterX = slotX + slotWidth / 2;
    if( ActiveSlotIndex == slotIndex && ActiveOptionPos == 0 ) {
        textColor = ActiveSlotColor;
        var slotNameWidth = string_width( string_hash_to_newline(slotName) );
        draw_sprite( sMenuTick, TickImageIndex, slotCenterX - slotNameWidth / 2 - tickMargin, slotTextY );
        draw_sprite( sMenuTick, TickImageIndex, slotCenterX + slotNameWidth / 2 + tickMargin, slotTextY );
    }
    draw_set_halign( fa_center );
    draw_text_outline( slotCenterX, slotTextY, slotName, textColor );
    draw_set_halign( fa_left );
    
    if( OverwriteModePos == -1 || ActiveSlotIndex != slotIndex ) {
        var saveData = SaveData[slotIndex];
        var isFreshSave = saveData[?"engine.freshSave"];
        if( isFreshSave ) {
            // New save label.
            draw_set_halign( fa_center );
            draw_text_outline( slotX + slotWidth / 2, slotTextY + lineHeight * 1.5, "New Game", textColor );
            draw_set_halign( fa_left );
        } else {
            // Death and time information.
            var deathCount = saveData[?"engine.death"];
            var time = saveData[?"engine.time"];

            var statTextMaxWidth = slotWidth - 2 * textLMargin - 24;
            var deathText = string( deathCount );        
            var deathTextScale = min( 1.0, statTextMaxWidth / string_width( string_hash_to_newline(deathText) ) );
            var timeText = create_time_string( time );    
            var timeTextScale = min( 1.0, statTextMaxWidth / string_width( string_hash_to_newline(timeText) ) );
            var textX = slotX + textLMargin + 24;
            var deathY = slotTextY + lineHeight + slotHeaderMargin;
            var timeY = slotTextY + lineHeight * 2 + slotHeaderMargin;
            draw_text_scaled_outline( textX, deathY, deathTextScale, deathTextScale, deathText, textColor );
            draw_text_scaled_outline( textX, timeY, timeTextScale, timeTextScale, timeText, textColor );
            draw_sprite( sSkullIcon, 0, slotX + textLMargin, deathY );
            draw_sprite( sClockIcon, 0, slotX + textLMargin, timeY );
        }
    } else {
        // Overwrite prompt.
        draw_set_halign( fa_center );
        draw_text_outline( slotX + slotWidth / 2, slotTextY + lineHeight + slotHeaderMargin, "Overwrite?", c_orange );
        draw_set_halign( fa_left );
        var yesColor = ActiveSlotColor;
        var noColor = SlotTextColor;
        if( OverwriteModePos == 1 ) {
            yesColor = SlotTextColor;
            noColor = ActiveSlotColor;
        }  
        draw_text_outline( slotX + textLMargin, slotTextY + lineHeight * 2 + slotHeaderMargin, "Yes", yesColor );
        draw_text_outline( slotX + textLMargin + 96, slotTextY + lineHeight * 2 + slotHeaderMargin, "No", noColor );
    }
}

// Back option text.
draw_set_halign( fa_center );
draw_set_valign( fa_center );
draw_set_font( fMenuOptionFont );
var optionX = x;
var optionY = rectT + slotHeight + 50;
var fontColor = OptionColor;
if( 1 == ActiveOptionPos ) {
    fontColor = ActiveOptionColor;
    var margin = 20;
    var optionWidth = string_width( string_hash_to_newline(MenuOptions[1]) );
    draw_sprite( sMenuTick, TickImageIndex, optionX - optionWidth / 2 - margin, optionY );
    draw_sprite( sMenuTick, TickImageIndex, optionX + optionWidth / 2 + margin, optionY );
}   
draw_text_outline( optionX, optionY, MenuOptions[1], fontColor );  

draw_set_halign( fa_left );
draw_set_valign( fa_top );
draw_set_color( c_white );

