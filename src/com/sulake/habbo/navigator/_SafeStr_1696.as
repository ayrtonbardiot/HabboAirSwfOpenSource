// by nota

//com.sulake.habbo.navigator._SafeStr_1696

package com.sulake.habbo.navigator
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import flash.geom.Point;
    import _-Ja._SafeStr_1569;

    public /*dynamic*/ interface _SafeStr_1696 extends IUnknown 
    {

        function get events():IEventDispatcher;
        function goToHomeRoom():Boolean;
        function performTagSearch(_arg_1:String):void;
        function performTextSearch(_arg_1:String):void;
        function performGuildBaseSearch():void;
        function performCompetitionRoomsSearch(_arg_1:int, _arg_2:int):void;
        function showOwnRooms():void;
        function goToPrivateRoom(_arg_1:int):void;
        function hasRoomRightsButIsNotOwner(_arg_1:int):Boolean;
        function removeRoomRights(_arg_1:int):void;
        function goToRoomNetwork(_arg_1:int, _arg_2:Boolean):void;
        function startRoomCreation():void;
        function openNavigator(_arg_1:Point=null):void;
        function closeNavigator():void;
        function get homeRoomId():int;
        function get enteredGuestRoomData():_SafeStr_1569;
        function showToolbarHover(_arg_1:Point):void;
        function hideToolbarHover(_arg_1:Boolean):void;
        function toggleRoomInfoVisibility():void;
        function canRateRoom():Boolean;
        function isRoomFavorite(_arg_1:int):Boolean;
        function isRoomHome(_arg_1:int):Boolean;
        function get visibleEventCategories():Array;

    }
}//package com.sulake.habbo.navigator

// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)


