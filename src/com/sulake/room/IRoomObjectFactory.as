// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.IRoomObjectFactory

package com.sulake.room
{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface IRoomObjectFactory extends IUnknown 
    {

        function addObjectEventListener(_arg_1:Function):void;
        function removeObjectEventListener(_arg_1:Function):void;
        function createRoomObjectLogic(_arg_1:String):IRoomObjectEventHandler;
        function createRoomObjectManager():IRoomObjectManager;
        function get events():IEventDispatcher;

    }
}//package com.sulake.room

