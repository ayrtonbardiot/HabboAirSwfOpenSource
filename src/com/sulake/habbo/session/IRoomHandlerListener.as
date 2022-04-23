// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.IRoomHandlerListener

package com.sulake.habbo.session
{
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface IRoomHandlerListener 
    {

        function sessionUpdate(_arg_1:int, _arg_2:String):void;
        function sessionReinitialize(_arg_1:int, _arg_2:int):void;
        function getSession(_arg_1:int):IRoomSession;
        function get events():IEventDispatcher;

    }
}//package com.sulake.habbo.session

