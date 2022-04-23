// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.renderer.IRoomRendererBase

package com.sulake.room.renderer
{
    import com.sulake.room.object.IRoomObject;

    public /*dynamic*/ interface IRoomRendererBase 
    {

        function dispose():void;
        function reset():void;
        function feedRoomObject(_arg_1:IRoomObject):void;
        function removeRoomObject(_arg_1:IRoomObject):void;
        function update(_arg_1:uint):void;

    }
}//package com.sulake.room.renderer

