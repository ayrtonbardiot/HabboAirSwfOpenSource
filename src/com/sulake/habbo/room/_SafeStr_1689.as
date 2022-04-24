// by nota

//com.sulake.habbo.room._SafeStr_1689

package com.sulake.habbo.room
{
    import com.sulake.room.IRoomInstance;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.utils._SafeStr_3172;
    import com.sulake.core.communication.connection.IConnection;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.game._SafeStr_1699;
    import com.sulake.habbo.room.utils._SafeStr_3137;
    import com.sulake.habbo.room.utils._SafeStr_3178;
    import com.sulake.habbo.room.utils._SafeStr_3262;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.renderer.IRoomRenderingCanvas;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.window._SafeStr_1695;

    [SecureSWF(rename="true")]
    public /*dynamic*/ interface _SafeStr_1689 extends _SafeStr_1687 
    {

        function getRoom(_arg_1:int):IRoomInstance;
        function getRoomObjectCategory(_arg_1:String):int;
        function getRoomObject(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject;
        function getRoomObjectWithIndex(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject;
        function getRoomObjectCount(_arg_1:int, _arg_2:int):int;
        function updateObjectRoomWindow(_arg_1:int, _arg_2:int, _arg_3:Boolean=true):void;
        function setObjectMoverIconSprite(_arg_1:int, _arg_2:int, _arg_3:Boolean, _arg_4:String=null, _arg_5:IStuffData=null, _arg_6:int=-1, _arg_7:int=-1, _arg_8:String=null):void;
        function setObjectMoverIconSpriteVisible(_arg_1:Boolean):void;
        function removeObjectMoverIconSprite():void;
        function getSelectedObjectData(_arg_1:int):ISelectedRoomObjectData;
        function setSelectedObjectData(_arg_1:int, _arg_2:_SafeStr_3172):void;
        function setPlacedObjectData(_arg_1:int, _arg_2:_SafeStr_3172):void;
        function getPlacedObjectData(_arg_1:int):ISelectedRoomObjectData;
        function get connection():IConnection;
        function get events():IEventDispatcher;
        function get gameEngine():_SafeStr_1699;
        function getLegacyGeometry(_arg_1:int):_SafeStr_3137;
        function getFurniStackingHeightMap(_arg_1:int):_SafeStr_3178;
        function getTileObjectMap(_arg_1:int):_SafeStr_3262;
        function getSelectionArrow(_arg_1:int):IRoomObjectController;
        function getTileCursor(_arg_1:int):IRoomObjectController;
        function getIsPlayingGame(_arg_1:int):Boolean;
        function getActiveRoomIsPlayingGame():Boolean;
        function requestRoomAdImage(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String):void;
        function requestMouseCursor(_arg_1:String, _arg_2:int, _arg_3:String):void;
        function addFloorHole(_arg_1:int, _arg_2:int):void;
        function removeFloorHole(_arg_1:int, _arg_2:int):void;
        function getActiveRoomActiveCanvas():IRoomRenderingCanvas;
        function requestBadgeImageAsset(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean=true):void;
        function get isDecorateMode():Boolean;
        function get isGameMode():Boolean;
        function get playerUnderCursor():int;
        function get configuration():_SafeStr_19;
        function get roomSessionManager():IRoomSessionManager;
        function get sessionDataManager():ISessionDataManager;
        function get toolbar():IHabboToolbar;
        function get catalog():IHabboCatalog;
        function get windowManager():_SafeStr_1695;

    }
}//package com.sulake.habbo.room

// _SafeStr_1687 = "_-22S" (String#14992, DoABC#4)
// _SafeStr_1689 = "_-018" (String#7789, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1699 = "_-uf" (String#3285, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_3137 = "_-71l" (String#4564, DoABC#4)
// _SafeStr_3172 = "_-eb" (String#2240, DoABC#4)
// _SafeStr_3178 = "_-pR" (String#3386, DoABC#4)
// _SafeStr_3262 = "_-m1x" (String#5603, DoABC#4)


