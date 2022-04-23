// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.messenger._SafeStr_1700

package com.sulake.habbo.messenger
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface _SafeStr_1700 extends IUnknown 
    {

        function get events():IEventDispatcher;
        function isOpen():Boolean;
        function toggleMessenger():void;
        function startConversation(_arg_1:int):void;
        function closeConversation(_arg_1:int):void;
        function setFollowingAllowed(_arg_1:int, _arg_2:Boolean):void;
        function setOnlineStatus(_arg_1:int, _arg_2:Boolean):void;
        function getUnseenMiniMailMessageCount():int;
        function getRoomInvitesIgnored():Boolean;
        function setRoomInvitesIgnored(_arg_1:Boolean):void;
        function get hasfriendsListInitialized():Boolean;
        function set followingToGroupRoom(_arg_1:Boolean):void;

    }
}//package com.sulake.habbo.messenger

// _SafeStr_1700 = "_-eD" (String#3930, DoABC#4)


