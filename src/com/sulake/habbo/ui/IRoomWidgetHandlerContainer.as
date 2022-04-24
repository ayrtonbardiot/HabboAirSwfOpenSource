// by nota

//com.sulake.habbo.ui.IRoomWidgetHandlerContainer

package com.sulake.habbo.ui
{
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.ISessionDataManager;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.inventory._SafeStr_1708;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.groups._SafeStr_1757;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.avatar._SafeStr_1758;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.messenger._SafeStr_1700;
    import com.sulake.habbo.moderation.IHabboModeration;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.game._SafeStr_1699;
    import com.sulake.habbo.quest._SafeStr_2046;
    import com.sulake.habbo.freeflowchat._SafeStr_1703;
    import flash.geom.Rectangle;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.session._SafeStr_3241;

    public /*dynamic*/ interface IRoomWidgetHandlerContainer 
    {

        function get habboTracking():_SafeStr_1704;
        function get roomSession():IRoomSession;
        function get sessionDataManager():ISessionDataManager;
        function get events():IEventDispatcher;
        function get roomEngine():IRoomEngine;
        function get friendList():_SafeStr_1874;
        function get avatarRenderManager():_SafeStr_1701;
        function get inventory():_SafeStr_1708;
        function get toolbar():IHabboToolbar;
        function get navigator():_SafeStr_1696;
        function get habboGroupsManager():_SafeStr_1757;
        function get roomWidgetFactory():IRoomWidgetFactory;
        function get roomSessionManager():IRoomSessionManager;
        function get avatarEditor():_SafeStr_1758;
        function get catalog():IHabboCatalog;
        function get localization():_SafeStr_18;
        function get habboHelp():IHabboHelp;
        function get config():_SafeStr_19;
        function get soundManager():_SafeStr_2088;
        function get messenger():_SafeStr_1700;
        function get moderation():IHabboModeration;
        function get windowManager():_SafeStr_1695;
        function get userDefinedRoomEvents():IHabboUserDefinedRoomEvents;
        function get connection():IConnection;
        function get gameManager():_SafeStr_1699;
        function get questEngine():_SafeStr_2046;
        function get freeFlowChat():_SafeStr_1703;
        function get layoutManager():_SafeStr_3343;
        function setRoomViewColor(_arg_1:uint, _arg_2:int):void;
        function getFirstCanvasId():int;
        function getRoomViewRect():Rectangle;
        function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent;
        function addUpdateListener(_arg_1:IRoomWidgetHandler):void;
        function removeUpdateListener(_arg_1:IRoomWidgetHandler):void;
        function isOwnerOfFurniture(_arg_1:IRoomObject):Boolean;
        function getFurnitureOwnerId(_arg_1:IRoomObject):int;
        function isOwnerOfPet(_arg_1:_SafeStr_3241):Boolean;
        function setRoomBackgroundColor(_arg_1:int, _arg_2:int, _arg_3:int):void;

    }
}//package com.sulake.habbo.ui

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1699 = "_-uf" (String#3285, DoABC#4)
// _SafeStr_1700 = "_-eD" (String#3930, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1703 = "_-Q1U" (String#4333, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_1757 = "_-h1P" (String#4520, DoABC#4)
// _SafeStr_1758 = "_-Y5" (String#3968, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_2046 = "_-y13" (String#3747, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3343 = "_-D1G" (String#10068, DoABC#4)


