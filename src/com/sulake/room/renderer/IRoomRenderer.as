﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.renderer.IRoomRenderer

package com.sulake.room.renderer
{
    public /*dynamic*/ interface IRoomRenderer extends IRoomRendererBase 
    {

        function set roomObjectVariableAccurateZ(_arg_1:String):void;
        function createCanvas(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):IRoomRenderingCanvas;
        function getCanvas(_arg_1:int):IRoomRenderingCanvas;
        function disposeCanvas(_arg_1:int):Boolean;

    }
}//package com.sulake.room.renderer

