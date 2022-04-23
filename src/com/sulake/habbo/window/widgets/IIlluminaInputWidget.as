// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.widgets.IIlluminaInputWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window._SafeStr_3179;

    public /*dynamic*/ interface IIlluminaInputWidget extends _SafeStr_3179 
    {

        function get message():String;
        function set message(_arg_1:String):void;
        function get submitHandler():IIlluminaInputHandler;
        function set submitHandler(_arg_1:IIlluminaInputHandler):void;
        function get buttonCaption():String;
        function set buttonCaption(_arg_1:String):void;
        function get emptyMessage():String;
        function set emptyMessage(_arg_1:String):void;
        function get multiline():Boolean;
        function set multiline(_arg_1:Boolean):void;
        function get maxChars():int;
        function set maxChars(_arg_1:int):void;

    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3179 = "_-wC" (String#2737, DoABC#4)


