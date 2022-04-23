// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendlist._SafeStr_1874

package com.sulake.habbo.friendlist
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import flash.geom.Point;
    import flash.utils.Dictionary;
    import com.sulake.core.window._SafeStr_3133;

    public /*dynamic*/ interface _SafeStr_1874 extends IUnknown 
    {

        function get events():IEventDispatcher;
        function canBeAskedForAFriend(_arg_1:int):Boolean;
        function askForAFriend(_arg_1:int, _arg_2:String):Boolean;
        function getFriend(_arg_1:int):_SafeStr_3173;
        function openFriendList():void;
        function openFriendRequests():void;
        function openFriendSearch():void;
        function close():void;
        function alignBottomLeftTo(_arg_1:Point):void;
        function isOpen():Boolean;
        function currentTabId():int;
        function getFriendCount(_arg_1:Boolean, _arg_2:Boolean):int;
        function openHabboWebPage(_arg_1:String, _arg_2:Dictionary, _arg_3:int, _arg_4:int):void;
        function getFriendNames():Array;
        function acceptFriendRequest(_arg_1:int):void;
        function acceptAllFriendRequests():void;
        function declineFriendRequest(_arg_1:int):void;
        function declineAllFriendRequests():void;
        function get mainWindow():_SafeStr_3133;
        function getRelationshipStatus(_arg_1:int):int;
        function setRelationshipStatus(_arg_1:int, _arg_2:int):void;
        function get hasfriendsListInitialized():Boolean;

    }
}//package com.sulake.habbo.friendlist

// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3173 = "_-o3" (String#6682, DoABC#4)


