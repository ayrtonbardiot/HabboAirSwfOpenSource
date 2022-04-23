// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room._SafeStr_1688

package com.sulake.habbo.room
{
    import com.sulake.room.IRoomInstance;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.habbo.room.utils._SafeStr_3178;
    import com.sulake.habbo.room.utils._SafeStr_3137;
    import com.sulake.habbo.room.utils._SafeStr_3262;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;

    [SecureSWF(rename="true")]
    public /*dynamic*/ interface _SafeStr_1688 extends _SafeStr_1687 
    {

        function initializeRoom(_arg_1:int, _arg_2:XML):void;
        function getRoom(_arg_1:int):IRoomInstance;
        function disposeRoom(_arg_1:int):void;
        function setOwnUserId(_arg_1:int, _arg_2:int):void;
        function setWorldType(_arg_1:int, _arg_2:String):void;
        function getObjectRoom(_arg_1:int):IRoomObjectController;
        function setFurniStackingHeightMap(_arg_1:int, _arg_2:_SafeStr_3178):void;
        function getFurniStackingHeightMap(_arg_1:int):_SafeStr_3178;
        function getLegacyGeometry(_arg_1:int):_SafeStr_3137;
        function getTileObjectMap(_arg_1:int):_SafeStr_3262;
        function getRoomNumberValue(_arg_1:int, _arg_2:String):Number;
        function getRoomStringValue(_arg_1:int, _arg_2:String):String;
        function setIsPlayingGame(_arg_1:int, _arg_2:Boolean):void;
        function refreshTileObjectMap(_arg_1:int, _arg_2:String):void;
        function get configuration():_SafeStr_19;
        function get roomSessionManager():IRoomSessionManager;
        function get sessionDataManager():ISessionDataManager;

    }
}//package com.sulake.habbo.room

// _SafeStr_1687 = "_-22S" (String#14992, DoABC#4)
// _SafeStr_1688 = "_-d1g" (String#11241, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_3137 = "_-71l" (String#4564, DoABC#4)
// _SafeStr_3178 = "_-pR" (String#3386, DoABC#4)
// _SafeStr_3262 = "_-m1x" (String#5603, DoABC#4)


