// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.data._SafeStr_3134

package com.sulake.habbo.friendbar.data
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface _SafeStr_3134 extends IUnknown 
    {

        function get events():IEventDispatcher;
        function get numFriends():int;
        function getFriendAt(_arg_1:int):_SafeStr_3377;
        function getFriendByID(_arg_1:int):_SafeStr_3377;
        function getFriendByName(_arg_1:String):_SafeStr_3377;
        function get numFriendRequests():int;
        function getFriendRequestAt(_arg_1:int):_SafeStr_3367;
        function getFriendRequestByID(_arg_1:int):_SafeStr_3367;
        function getFriendRequestByName(_arg_1:String):_SafeStr_3367;
        function getFriendRequestList():Array;
        function acceptFriendRequest(_arg_1:int):void;
        function acceptAllFriendRequests():void;
        function declineFriendRequest(_arg_1:int):void;
        function declineAllFriendRequests():void;
        function followToRoom(_arg_1:int):void;
        function startConversation(_arg_1:int):void;
        function findNewFriends():void;
        function openUserTextSearch():void;
        function sendGameTabTracking(_arg_1:String):void;
        function sendGameButtonTracking(_arg_1:String):void;
        function toggleFriendList():void;
        function toggleMessenger():void;
        function showProfile(_arg_1:int):void;
        function showProfileByName(_arg_1:String):void;

    }
}//package com.sulake.habbo.friendbar.data

// _SafeStr_3134 = "_-Jw" (String#11081, DoABC#4)
// _SafeStr_3367 = "_-41n" (String#5091, DoABC#4)
// _SafeStr_3377 = "_-1d" (String#2910, DoABC#4)


