﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.components.ITextFieldWindow

package com.sulake.core.window.components
{
    public /*dynamic*/ interface ITextFieldWindow extends ITextWindow, _SafeStr_3162, IInteractiveWindow 
    {

        function get editable():Boolean;
        function set editable(_arg_1:Boolean):void;
        function get selectable():Boolean;
        function set selectable(_arg_1:Boolean):void;
        function get displayAsPassword():Boolean;
        function set displayAsPassword(_arg_1:Boolean):void;
        function get displayRaw():Boolean;
        function set displayRaw(_arg_1:Boolean):void;
        function setSelection(_arg_1:int, _arg_2:int):void;
        function get selectionBeginIndex():int;
        function get selectionEndIndex():int;
        function get restrict():String;
        function set restrict(_arg_1:String):void;
        function requestChangeEvent():void;
        function getWordAt(_arg_1:int, _arg_2:int):String;

    }
}//package com.sulake.core.window.components

// _SafeStr_3162 = "_-21D" (String#5841, DoABC#4)


