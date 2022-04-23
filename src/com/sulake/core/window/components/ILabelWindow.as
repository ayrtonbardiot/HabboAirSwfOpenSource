// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.ILabelWindow

package com.sulake.core.window.components
{
    import com.sulake.core.window._SafeStr_3109;
    import flash.text.TextFormat;
    import com.sulake.core.window.utils.IMargins;
    import com.sulake.core.window.utils._SafeStr_3350;

    public /*dynamic*/ interface ILabelWindow extends _SafeStr_3109 
    {

        function get antiAliasType():String;
        function get autoSize():String;
        function get bold():Boolean;
        function get border():Boolean;
        function get borderColor():uint;
        function get defaultTextFormat():TextFormat;
        function get embedFonts():Boolean;
        function get fontFace():String;
        function get fontSize():uint;
        function get gridFitType():String;
        function get italic():Boolean;
        function get kerning():Boolean;
        function get length():int;
        function get margins():IMargins;
        function get maxChars():int;
        function get sharpness():Number;
        function get spacing():Number;
        function get text():String;
        function get textColor():uint;
        function get textBackground():Boolean;
        function get textBackgroundColor():uint;
        function get textHeight():Number;
        function get textWidth():Number;
        function get textStyle():_SafeStr_3350;
        function get thickness():Number;
        function get underline():Boolean;
        function get vertical():Boolean;
        function set text(_arg_1:String):void;
        function set textStyle(_arg_1:_SafeStr_3350):void;
        function set textColor(_arg_1:uint):void;
        function set vertical(_arg_1:Boolean):void;

    }
}//package com.sulake.core.window.components

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3350 = "_-O1m" (String#1615, DoABC#4)


