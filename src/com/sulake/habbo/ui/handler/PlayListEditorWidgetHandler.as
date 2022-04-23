﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.handler.PlayListEditorWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Go._SafeStr_216;
    import _-Go._SafeStr_424;
    import _-Go._SafeStr_366;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorEvent;
    import _-j1G._SafeStr_558;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListModificationMessage;
    import _-v5._SafeStr_140;
    import _-v5._SafeStr_874;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListPlayStateMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineSoundMachineEvent;
    import flash.events.Event;
    import com.sulake.habbo.sound.events.NowPlayingEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorNowPlayingEvent;

    public class PlayListEditorWidgetHandler implements IRoomWidgetHandler 
    {

        private var _disposed:Boolean = false;
        private var _container:IRoomWidgetHandlerContainer;
        private var _connection:IConnection = null;
        private var _SafeStr_6098:IMessageEvent;
        private var _SafeStr_6099:IMessageEvent;
        private var _SafeStr_6080:IMessageEvent;


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get type():String
        {
            return ("RWE_PLAYLIST_EDITOR_WIDGET");
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
            if (_container.soundManager)
            {
                _container.soundManager.events.addEventListener("SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT", processSoundManagerEvent);
                _container.soundManager.events.addEventListener("PLUE_PLAY_LIST_UPDATED", processSoundManagerEvent);
                _container.soundManager.events.addEventListener("PLUE_PLAY_LIST_FULL", processSoundManagerEvent);
                _container.soundManager.events.addEventListener("NPE_SONG_CHANGED", processSoundManagerEvent);
                _container.soundManager.events.addEventListener("NPE_USER_PLAY_SONG", processSoundManagerEvent);
                _container.soundManager.events.addEventListener("NPW_USER_STOP_SONG", processSoundManagerEvent);
            };
        }

        public function set connection(_arg_1:IConnection):void
        {
            _SafeStr_6098 = new _SafeStr_216(onFurniListUpdated);
            _SafeStr_6099 = new _SafeStr_424(onFurniListUpdated);
            _SafeStr_6080 = new _SafeStr_366(onFurniListUpdated);
            _connection = _arg_1;
            _connection.addMessageEvent(_SafeStr_6098);
            _connection.addMessageEvent(_SafeStr_6099);
            _connection.addMessageEvent(_SafeStr_6080);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _disposed = true;
                if (_connection)
                {
                    _connection.removeMessageEvent(_SafeStr_6098);
                    _connection.removeMessageEvent(_SafeStr_6099);
                    _connection.removeMessageEvent(_SafeStr_6080);
                };
                _connection = null;
                _SafeStr_6098 = null;
                if (_container)
                {
                    if (_container.soundManager)
                    {
                        if (_container.soundManager.events)
                        {
                            _container.soundManager.events.removeEventListener("SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT", processSoundManagerEvent);
                            _container.soundManager.events.removeEventListener("PLUE_PLAY_LIST_UPDATED", processSoundManagerEvent);
                            _container.soundManager.events.removeEventListener("PLUE_PLAY_LIST_FULL", processSoundManagerEvent);
                            _container.soundManager.events.removeEventListener("NPE_SONG_CHANGED", processSoundManagerEvent);
                            _container.soundManager.events.removeEventListener("NPE_USER_PLAY_SONG", processSoundManagerEvent);
                            _container.soundManager.events.removeEventListener("NPW_USER_STOP_SONG", processSoundManagerEvent);
                        };
                    };
                    _container = null;
                };
            };
        }

        public function getWidgetMessages():Array
        {
            return (["RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR", "RWPLAM_ADD_TO_PLAYLIST", "RWPLAM_REMOVE_FROM_PLAYLIST", "RWPLPS_TOGGLE_PLAY_PAUSE", "RWPLUA_OPEN_CATALOGUE_BUTTON_PRESSED"]);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_7:Boolean;
            var _local_2:Boolean;
            var _local_3:* = null;
            var _local_8:* = null;
            var _local_9:* = null;
            var _local_6:* = null;
            switch (_arg_1.type)
            {
                case "RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR":
                    _local_5 = (_arg_1 as RoomWidgetFurniToWidgetMessage);
                    _local_4 = _container.roomEngine.getRoomObject(_local_5.roomId, _local_5.id, _local_5.category);
                    if (_local_4 != null)
                    {
                        _local_7 = _container.isOwnerOfFurniture(_local_4);
                        _local_2 = (((_container.roomSession.isRoomOwner) || (_container.roomSession.roomControllerLevel >= 1)) || (_container.sessionDataManager.isAnyRoomController));
                        if (_local_7)
                        {
                            _local_3 = new RoomWidgetPlayListEditorEvent("RWPLEE_SHOW_PLAYLIST_EDITOR", _local_5.id);
                            _container.events.dispatchEvent(_local_3);
                        }
                        else
                        {
                            if (_local_2)
                            {
                                if (_connection != null)
                                {
                                    _connection.send(new _SafeStr_558(_local_4.getId(), -2));
                                };
                            };
                        };
                    };
                    break;
                case "RWPLAM_ADD_TO_PLAYLIST":
                    _local_8 = (_arg_1 as RoomWidgetPlayListModificationMessage);
                    if (_connection != null)
                    {
                        _connection.send(new _SafeStr_140(_local_8.diskId, _local_8.slotNumber));
                    };
                    break;
                case "RWPLAM_REMOVE_FROM_PLAYLIST":
                    _local_9 = (_arg_1 as RoomWidgetPlayListModificationMessage);
                    if (_connection != null)
                    {
                        _connection.send(new _SafeStr_874(_local_9.slotNumber));
                    };
                    break;
                case "RWPLPS_TOGGLE_PLAY_PAUSE":
                    _local_6 = (_arg_1 as RoomWidgetPlayListPlayStateMessage);
                    if (_connection != null)
                    {
                        _connection.send(new _SafeStr_558(_local_6.furniId, _local_6.position));
                    };
                    break;
                case "RWPLUA_OPEN_CATALOGUE_BUTTON_PRESSED":
                    _container.habboTracking.trackGoogle("playlistEditorPanelOpenCatalogue", "click");
            };
            return (null);
        }

        public function getProcessedEvents():Array
        {
            var _local_1:Array = [];
            _local_1.push("ROSM_JUKEBOX_DISPOSE");
            return (_local_1);
        }

        public function processEvent(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            switch (_arg_1.type)
            {
                case "ROSM_JUKEBOX_DISPOSE":
                    _local_2 = (_arg_1 as RoomEngineSoundMachineEvent);
                    _local_3 = new RoomWidgetPlayListEditorEvent("RWPLEE_HIDE_PLAYLIST_EDITOR", _local_2.objectId);
                    _container.events.dispatchEvent(_local_3);
                    return;
            };
        }

        public function update():void
        {
        }

        private function onFurniListUpdated(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_216 = (_arg_1 as _SafeStr_216);
            if (((_local_2) && (_local_2.getParser().fragmentNo == 0)))
            {
                if (_container != null)
                {
                    if (_container.events != null)
                    {
                        _container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent("RWPLEE_INVENTORY_UPDATED", -1));
                    };
                };
            };
        }

        private function processSoundManagerEvent(_arg_1:Event):void
        {
            var _local_2:* = null;
            switch (_arg_1.type)
            {
                case "SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT":
                    _container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent("RWPLEE_SONG_DISK_INVENTORY_UPDATED"));
                    return;
                case "PLUE_PLAY_LIST_UPDATED":
                    _container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent("RWPLEE_PLAY_LIST_UPDATED"));
                    return;
                case "PLUE_PLAY_LIST_FULL":
                    _container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent("RWPLEE_PLAY_LIST_FULL"));
                    return;
                case "NPE_SONG_CHANGED":
                    _local_2 = (_arg_1 as NowPlayingEvent);
                    _container.events.dispatchEvent(new RoomWidgetPlayListEditorNowPlayingEvent("RWPLENPE_SONG_CHANGED", _local_2.id, _local_2.position, _local_2.priority));
                    return;
                case "NPE_USER_PLAY_SONG":
                    _local_2 = (_arg_1 as NowPlayingEvent);
                    _container.events.dispatchEvent(new RoomWidgetPlayListEditorNowPlayingEvent("RWPLENPE_USER_PLAY_SONG", _local_2.id, _local_2.position, _local_2.priority));
                    return;
                case "NPW_USER_STOP_SONG":
                    _local_2 = (_arg_1 as NowPlayingEvent);
                    _container.events.dispatchEvent(new RoomWidgetPlayListEditorNowPlayingEvent("RWPLENPW_USER_STOP_SONG", _local_2.id, _local_2.position, _local_2.priority));
                    return;
            };
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_140 = "_-41t" (String#31274, DoABC#4)
// _SafeStr_216 = "_-Jh" (String#11263, DoABC#4)
// _SafeStr_366 = "_-g1u" (String#10462, DoABC#4)
// _SafeStr_424 = "_-O1b" (String#14726, DoABC#4)
// _SafeStr_558 = "_-z11" (String#4154, DoABC#4)
// _SafeStr_6080 = "_-oL" (String#5118, DoABC#4)
// _SafeStr_6098 = "_-r1u" (String#10955, DoABC#4)
// _SafeStr_6099 = "_-Rg" (String#14959, DoABC#4)
// _SafeStr_874 = "_-s7" (String#30494, DoABC#4)


