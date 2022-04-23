// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.RoomDesktop

package com.sulake.habbo.ui
{
    import com.sulake.habbo.ui.widget.IRoomWidgetMessageListener;
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.inventory._SafeStr_1708;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.messenger._SafeStr_1700;
    import com.sulake.habbo.groups._SafeStr_1757;
    import com.sulake.habbo.avatar._SafeStr_1758;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.advertisement._SafeStr_1705;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.moderation.IHabboModeration;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
    import com.sulake.habbo.game._SafeStr_1699;
    import com.sulake.habbo.quest._SafeStr_2046;
    import com.sulake.habbo.freeflowchat._SafeStr_1703;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.components._SafeStr_3189;
    import com.sulake.core.window.components.IToolTipWindow;
    import flash.utils.Timer;
    import flash.geom.Rectangle;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.geom.Point;
    import _-u7._SafeStr_578;
    import _-u7._SafeStr_177;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.IRoomWidget;
    import _-6L._SafeStr_1351;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotSkillListUpdateEvent;
    import _-6L._SafeStr_1398;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotForceOpenContextMenuEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetLoadingBarUpdateEvent;
    import com.sulake.room.events.RoomContentLoadedEvent;
    import com.sulake.habbo.ui.handler.ChatWidgetHandler;
    import com.sulake.habbo.ui.handler.InfoStandWidgetHandler;
    import com.sulake.habbo.ui.handler.ChatInputWidgetHandler;
    import com.sulake.habbo.ui.handler.MeMenuWidgetHandler;
    import com.sulake.habbo.ui.handler.PlaceholderWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureCreditWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureStickieWidgetHandler;
    import com.sulake.habbo.ui.handler.FurniturePresentWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureTrophyWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureEcotronBoxWidgetHandler;
    import com.sulake.habbo.ui.handler.PetPackageFurniWidgetHandler;
    import com.sulake.habbo.ui.handler.DoorbellWidgetHandler;
    import com.sulake.habbo.ui.handler.RoomQueueWidgetHandler;
    import com.sulake.habbo.ui.handler.LoadingBarWidgetHandler;
    import com.sulake.habbo.ui.handler.PollWidgetHandler;
    import com.sulake.habbo.ui.handler.WordQuizWidgetHandler;
    import com.sulake.habbo.ui.handler.FurniChooserWidgetHandler;
    import com.sulake.habbo.ui.handler.UserChooserWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureDimmerWidgetHandler;
    import com.sulake.habbo.ui.handler.FriendRequestWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureClothingChangeWidgetHandler;
    import com.sulake.habbo.ui.handler.ConversionPointWidgetHandler;
    import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
    import com.sulake.habbo.ui.handler.PlayListEditorWidgetHandler;
    import com.sulake.habbo.ui.handler.SpamWallPostItWidgetHandler;
    import com.sulake.habbo.ui.handler._SafeStr_3379;
    import com.sulake.habbo.ui.handler.MannequinWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureContextMenuWidgetHandler;
    import com.sulake.habbo.ui.handler.ObjectLocationRequestHandler;
    import com.sulake.habbo.ui.handler.CameraWidgetHandler;
    import com.sulake.habbo.ui.handler.FurnitureBackgroundColorWidgetHandler;
    import com.sulake.habbo.ui.handler.CustomUserNotificationWidgetHandler;
    import com.sulake.habbo.ui.handler._SafeStr_3316;
    import com.sulake.habbo.ui.handler._SafeStr_3374;
    import com.sulake.habbo.ui.handler._SafeStr_3305;
    import com.sulake.habbo.ui.handler._SafeStr_3313;
    import com.sulake.habbo.ui.handler._SafeStr_3318;
    import com.sulake.habbo.ui.handler.FurnitureRoomLinkHandler;
    import com.sulake.habbo.ui.handler._SafeStr_3328;
    import com.sulake.habbo.ui.handler._SafeStr_3306;
    import com.sulake.habbo.ui.handler._SafeStr_3304;
    import com.sulake.habbo.ui.handler._SafeStr_3372;
    import com.sulake.habbo.ui.handler.RoomToolsWidgetHandler;
    import com.sulake.habbo.ui.handler.ExternalImageWidgetHandler;
    import com.sulake.habbo.ui.handler.UiHelpBubbleWidgetHandler;
    import com.sulake.habbo.ui.handler.RoomThumbnailCameraWidgetHandler;
    import com.sulake.habbo.ui.handler.CraftingWidgetHandler;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomViewUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
    import flash.events.Event;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
    import com.sulake.room.utils.RoomId;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomEngineUpdateEvent;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import flash.display.DisplayObject;
    import com.sulake.room.utils.RoomGeometry;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.room.utils.ColorConverter;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window._SafeStr_3109;
    import flash.events.TimerEvent;
    import flash.utils.getTimer;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.runtime._SafeStr_20;
    import flash.filters.BlurFilter;
    import flash.display.BitmapData;
    import flash.filters.DisplacementMapFilter;
    import flash.filters.BitmapFilter;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.habbo.session._SafeStr_3241;
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import com.sulake.habbo.ui.handler.*;

    public class RoomDesktop implements IRoomDesktop, IRoomWidgetMessageListener, IRoomWidgetHandlerContainer 
    {

        public static const STATE_UNDEFINED:int = -1;
        private static const RESIZE_UPDATE_TIMEOUT_MS:int = 1000;
        private static const SCALE_UPDATE_TIMEOUT_MS:int = 1000;

        private var _SafeStr_3983:EventDispatcherWrapper;
        private var _windowManager:_SafeStr_1695 = null;
        private var _roomEngine:IRoomEngine = null;
        private var _SafeStr_3938:IRoomWidgetFactory = null;
        private var _sessionDataManager:ISessionDataManager = null;
        private var _roomSessionManager:IRoomSessionManager = null;
        private var _communicationManager:_SafeStr_25 = null;
        private var _avatarRenderManager:_SafeStr_1701 = null;
        private var _friendList:_SafeStr_1874 = null;
        private var _inventory:_SafeStr_1708 = null;
        private var _toolbar:IHabboToolbar = null;
        private var _navigator:_SafeStr_1696 = null;
        private var _messenger:_SafeStr_1700 = null;
        private var _habboGroupsManager:_SafeStr_1757 = null;
        private var _avatarEditor:_SafeStr_1758 = null;
        private var _catalog:IHabboCatalog = null;
        private var _adManager:_SafeStr_1705 = null;
        private var _localization:_SafeStr_18 = null;
        private var _habboHelp:IHabboHelp = null;
        private var _connection:IConnection = null;
        private var _moderation:IHabboModeration;
        private var _config:_SafeStr_19;
        private var _soundManager:_SafeStr_2088;
        private var _habboTracking:_SafeStr_1704;
        private var _userDefinedRoomEvents:IHabboUserDefinedRoomEvents;
        private var _gameManager:_SafeStr_1699;
        private var _questEngine:_SafeStr_2046;
        private var _freeFlowChat:_SafeStr_1703;
        private var _assets:_SafeStr_21 = null;
        private var _session:IRoomSession = null;
        private var _SafeStr_4345:Array = [];
        private var _SafeStr_4346:_SafeStr_24;
        private var _SafeStr_4347:_SafeStr_24;
        private var _SafeStr_4348:_SafeStr_24;
        private var _updateListeners:Array;
        private var _SafeStr_4344:_SafeStr_3343;
        private var _SafeStr_4343:_SafeStr_3189;
        private var _SafeStr_4355:Boolean = true;
        private var _SafeStr_3936:Array;
        private var _SafeStr_4349:IToolTipWindow;
        private var _roomColor:uint = 0xFFFFFF;
        private var _SafeStr_4352:Boolean = false;
        private var _zoomChangedMillis:int = 0;
        private var _roomBackgroundColor:uint = 0;
        private var _SafeStr_4078:Timer;
        private var _SafeStr_4351:Rectangle;
        private var _SafeStr_4341:IMessageEvent;
        private var _SafeStr_4342:IMessageEvent;
        private var _SafeStr_4353:Point;
        private var _SafeStr_4592:Number = 0;
        private var _SafeStr_4350:Number = 0;
        private var _SafeStr_4354:Boolean;

        public function RoomDesktop(_arg_1:IRoomSession, _arg_2:_SafeStr_21, _arg_3:IConnection)
        {
            _SafeStr_3983 = new EventDispatcherWrapper();
            _session = _arg_1;
            _assets = _arg_2;
            _connection = _arg_3;
            _SafeStr_4341 = new _SafeStr_578(onBotSkillListUpdateEvent);
            _connection.addMessageEvent(_SafeStr_4341);
            _SafeStr_4342 = new _SafeStr_177(onBotForceOpenContextMenuEvent);
            _connection.addMessageEvent(_SafeStr_4342);
            _SafeStr_4346 = new _SafeStr_24();
            _SafeStr_4347 = new _SafeStr_24();
            _SafeStr_4348 = new _SafeStr_24();
            _SafeStr_4344 = new _SafeStr_3343();
            checkInterrupts();
        }

        public function set visible(_arg_1:Boolean):void
        {
            if (_SafeStr_4343)
            {
                _SafeStr_4343.visible = _arg_1;
            };
        }

        public function get roomSession():IRoomSession
        {
            return (_session);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get events():IEventDispatcher
        {
            return (_SafeStr_3983);
        }

        public function get roomEngine():IRoomEngine
        {
            return (_roomEngine);
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return (_roomSessionManager);
        }

        public function get friendList():_SafeStr_1874
        {
            return (_friendList);
        }

        public function get avatarRenderManager():_SafeStr_1701
        {
            return (_avatarRenderManager);
        }

        public function get inventory():_SafeStr_1708
        {
            return (((_inventory) && (!(_inventory.disposed))) ? _inventory : null);
        }

        public function get toolbar():IHabboToolbar
        {
            return (_toolbar);
        }

        public function get roomWidgetFactory():IRoomWidgetFactory
        {
            return (_SafeStr_3938);
        }

        public function get navigator():_SafeStr_1696
        {
            return (_navigator);
        }

        public function get habboGroupsManager():_SafeStr_1757
        {
            return (_habboGroupsManager);
        }

        public function get communicationManager():_SafeStr_25
        {
            return (_communicationManager);
        }

        public function get avatarEditor():_SafeStr_1758
        {
            return (_avatarEditor);
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        public function get habboHelp():IHabboHelp
        {
            return (_habboHelp);
        }

        public function get config():_SafeStr_19
        {
            return (_config);
        }

        public function get soundManager():_SafeStr_2088
        {
            return (_soundManager);
        }

        public function get messenger():_SafeStr_1700
        {
            return (_messenger);
        }

        public function get moderation():IHabboModeration
        {
            return (_moderation);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get habboTracking():_SafeStr_1704
        {
            return (_habboTracking);
        }

        public function get session():IRoomSession
        {
            return (_session);
        }

        public function get gameManager():_SafeStr_1699
        {
            return (_gameManager);
        }

        public function get questEngine():_SafeStr_2046
        {
            return (_questEngine);
        }

        public function get freeFlowChat():_SafeStr_1703
        {
            return (_freeFlowChat);
        }

        public function get roomBackgroundColor():uint
        {
            return (_roomBackgroundColor);
        }

        public function set catalog(_arg_1:IHabboCatalog):void
        {
            _catalog = _arg_1;
        }

        public function set avatarEditor(_arg_1:_SafeStr_1758):void
        {
            _avatarEditor = _arg_1;
        }

        public function set roomWidgetFactory(_arg_1:IRoomWidgetFactory):void
        {
            _SafeStr_3938 = _arg_1;
        }

        public function set sessionDataManager(_arg_1:ISessionDataManager):void
        {
            _sessionDataManager = _arg_1;
        }

        public function set roomSessionManager(_arg_1:IRoomSessionManager):void
        {
            _roomSessionManager = _arg_1;
            checkInterrupts();
        }

        public function set communicationManager(_arg_1:_SafeStr_25):void
        {
            _communicationManager = _arg_1;
        }

        public function get userDefinedRoomEvents():IHabboUserDefinedRoomEvents
        {
            return (_userDefinedRoomEvents);
        }

        public function get connection():IConnection
        {
            return (_connection);
        }

        public function set friendList(_arg_1:_SafeStr_1874):void
        {
            _friendList = _arg_1;
            if (_friendList)
            {
                _friendList.events.addEventListener("FRE_ACCEPTED", processEvent);
                _friendList.events.addEventListener("FRE_DECLINED", processEvent);
            };
        }

        public function set avatarRenderManager(_arg_1:_SafeStr_1701):void
        {
            _avatarRenderManager = _arg_1;
        }

        public function set windowManager(_arg_1:_SafeStr_1695):void
        {
            _windowManager = _arg_1;
        }

        public function set inventory(_arg_1:_SafeStr_1708):void
        {
            _inventory = _arg_1;
        }

        public function set navigator(_arg_1:_SafeStr_1696):void
        {
            _navigator = _arg_1;
        }

        public function set adManager(_arg_1:_SafeStr_1705):void
        {
            _adManager = _arg_1;
        }

        public function set localization(_arg_1:_SafeStr_18):void
        {
            _localization = _arg_1;
        }

        public function set habboHelp(_arg_1:IHabboHelp):void
        {
            _habboHelp = _arg_1;
        }

        public function set moderation(_arg_1:IHabboModeration):void
        {
            _moderation = _arg_1;
        }

        public function set config(_arg_1:_SafeStr_19):void
        {
            _config = _arg_1;
        }

        public function set soundManager(_arg_1:_SafeStr_2088):void
        {
            _soundManager = _arg_1;
        }

        public function set habboTracking(_arg_1:_SafeStr_1704):void
        {
            _habboTracking = _arg_1;
        }

        public function set userDefinedRoomEvents(_arg_1:IHabboUserDefinedRoomEvents):void
        {
            _userDefinedRoomEvents = _arg_1;
        }

        public function set gameManager(_arg_1:_SafeStr_1699):void
        {
            _gameManager = _arg_1;
        }

        public function set questEngine(_arg_1:_SafeStr_2046):void
        {
            _questEngine = _arg_1;
        }

        public function set freeFlowChat(_arg_1:_SafeStr_1703):void
        {
            _freeFlowChat = _arg_1;
        }

        public function set habboGroupsManager(_arg_1:_SafeStr_1757):void
        {
            _habboGroupsManager = _arg_1;
        }

        public function set roomEngine(_arg_1:IRoomEngine):void
        {
            _roomEngine = _arg_1;
            if (((!(_roomEngine == null)) && (!(_roomEngine.events == null))))
            {
                _roomEngine.events.addEventListener("RCLE_SUCCESS", onRoomContentLoaded);
                _roomEngine.events.addEventListener("RCLE_FAILURE", onRoomContentLoaded);
                _roomEngine.events.addEventListener("RCLE_CANCEL", onRoomContentLoaded);
            };
        }

        public function set messenger(_arg_1:_SafeStr_1700):void
        {
            _messenger = _arg_1;
        }

        public function set toolbar(_arg_1:IHabboToolbar):void
        {
            _toolbar = _arg_1;
            _toolbar.events.addEventListener("HTIE_ICON_ZOOM", onToolbarEvent);
        }

        public function set layout(_arg_1:XML):void
        {
            _SafeStr_4344.setLayout(_arg_1, _windowManager, _config);
        }

        public function dispose():void
        {
            var _local_5:* = null;
            var _local_4:int;
            var _local_3:* = null;
            var _local_1:* = null;
            if (((!(_roomEngine == null)) && (!(_session == null))))
            {
                _local_5 = _roomEngine.getRoomCanvasGeometry(_session.roomId, getFirstCanvasId());
                if (_local_5 != null)
                {
                    trackZooming(_local_5.isZoomedIn(), false);
                };
            };
            var _local_2:int;
            if (_SafeStr_4345 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_4345.length)
                {
                    _local_4 = _SafeStr_4345[_local_2];
                    _local_3 = getWindowName(_local_4);
                    if (_windowManager)
                    {
                        _windowManager.removeWindow(_local_3);
                    };
                    _local_2++;
                };
            };
            _updateListeners = null;
            if (_SafeStr_4346 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_4346.length)
                {
                    _local_1 = (_SafeStr_4346.getWithIndex(_local_2) as IRoomWidget);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _SafeStr_4346.dispose();
                _SafeStr_4346 = null;
            };
            if (_SafeStr_4347 != null)
            {
                _SafeStr_4347.dispose();
                _SafeStr_4347 = null;
            };
            if (_SafeStr_4348 != null)
            {
                _SafeStr_4348.dispose();
                _SafeStr_4348 = null;
            };
            if (_connection)
            {
                if (_SafeStr_4341 != null)
                {
                    _connection.removeMessageEvent(_SafeStr_4341);
                    _SafeStr_4341.dispose();
                    _SafeStr_4341 = null;
                };
                if (_SafeStr_4342 != null)
                {
                    _connection.removeMessageEvent(_SafeStr_4342);
                    _SafeStr_4342.dispose();
                    _SafeStr_4342 = null;
                };
                _connection = null;
            };
            _assets = null;
            _avatarRenderManager = null;
            _SafeStr_4345 = null;
            _SafeStr_3983 = null;
            if (((_friendList) && (_friendList.events)))
            {
                _friendList.events.removeEventListener("FRE_ACCEPTED", processEvent);
                _friendList.events.removeEventListener("FRE_DECLINED", processEvent);
            };
            _friendList = null;
            _SafeStr_4344.dispose();
            _SafeStr_4344 = null;
            if (((!(_roomEngine == null)) && (!(_roomEngine.events == null))))
            {
                _roomEngine.events.removeEventListener("RCLE_SUCCESS", onRoomContentLoaded);
                _roomEngine.events.removeEventListener("RCLE_FAILURE", onRoomContentLoaded);
                _roomEngine.events.removeEventListener("RCLE_CANCEL", onRoomContentLoaded);
            };
            _roomEngine = null;
            _roomSessionManager = null;
            _SafeStr_3938 = null;
            _session = null;
            _sessionDataManager = null;
            _windowManager = null;
            _inventory = null;
            _localization = null;
            _config = null;
            _soundManager = null;
            _habboGroupsManager = null;
            if (((_toolbar) && (toolbar.events)))
            {
                _toolbar.events.removeEventListener("HTIE_ICON_ZOOM", onToolbarEvent);
                _toolbar = null;
            };
            _navigator = null;
            if (_SafeStr_4349 != null)
            {
                _SafeStr_4349.dispose();
                _SafeStr_4349 = null;
            };
            if (_SafeStr_4078 != null)
            {
                _SafeStr_4078.reset();
                _SafeStr_4078.removeEventListener("timer", onResizeTimerEvent);
                _SafeStr_4078 = null;
            };
            _SafeStr_4351 = null;
        }

        private function onBotSkillListUpdateEvent(_arg_1:_SafeStr_578):void
        {
            var _local_2:* = null;
            var _local_3:_SafeStr_1351 = _arg_1.getParser();
            if (_session != null)
            {
                _local_2 = _session.userDataManager.getRentableBotUserData(_local_3.botId);
                _local_2.botSkillData = _arg_1.getParser().skillList.concat();
            };
            events.dispatchEvent(new RoomWidgetRentableBotSkillListUpdateEvent(_local_3.botId, _local_3.skillList));
        }

        private function onBotForceOpenContextMenuEvent(_arg_1:_SafeStr_177):void
        {
            var _local_2:_SafeStr_1398 = _arg_1.getParser();
            events.dispatchEvent(new RoomWidgetRentableBotForceOpenContextMenuEvent(_local_2.botId));
        }

        public function init():void
        {
            if (((!(_roomEngine == null)) && (!(_session == null))))
            {
                _SafeStr_3936 = [];
                if (_SafeStr_3936.length > 0)
                {
                    _SafeStr_4355 = false;
                    processEvent(new RoomWidgetLoadingBarUpdateEvent("RWLBUE_SHOW_LOADING_BAR"));
                };
            };
        }

        public function requestInterstitial():void
        {
            if (_adManager != null)
            {
                _adManager.showInterstitial();
            };
        }

        private function onRoomContentLoaded(_arg_1:RoomContentLoadedEvent):void
        {
            if (((_SafeStr_3936 == null) || (_SafeStr_3936.length == 0)))
            {
                return;
            };
            var _local_2:int = _SafeStr_3936.indexOf(_arg_1.contentType);
            if (_local_2 != -1)
            {
                _SafeStr_3936.splice(_local_2, 1);
            };
            if (_SafeStr_3936.length == 0)
            {
                _SafeStr_4355 = true;
                checkInterrupts();
            };
        }

        public function createWidget(_arg_1:String):void
        {
            var _local_8:Boolean;
            var _local_2:* = null;
            var _local_6:* = null;
            var _local_15:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_10:* = null;
            var _local_7:* = null;
            var _local_12:* = null;
            var _local_13:* = null;
            var _local_16:* = null;
            var _local_11:* = null;
            if (_SafeStr_3938 == null)
            {
                return;
            };
            var _local_4:IRoomWidget = (_SafeStr_4346.getValue(_arg_1) as IRoomWidget);
            if (_local_4 != null)
            {
                return;
            };
            if (((_session.isGameSession) && (!(isGameWidget(_arg_1)))))
            {
                return;
            };
            switch (_arg_1)
            {
                case "RWE_CHAT_WIDGET":
                    _local_6 = new ChatWidgetHandler();
                    _local_6.connection = _connection;
                    _local_2 = _local_6;
                    _local_8 = true;
                    break;
                case "RWE_INFOSTAND":
                    _local_2 = new InfoStandWidgetHandler(_soundManager.musicController);
                    break;
                case "RWE_CHAT_INPUT_WIDGET":
                    _local_8 = true;
                    _local_2 = new ChatInputWidgetHandler();
                    break;
                case "RWE_ME_MENU":
                    _local_2 = new MeMenuWidgetHandler();
                    break;
                case "RWE_FURNI_PLACEHOLDER":
                    _local_2 = new PlaceholderWidgetHandler();
                    break;
                case "RWE_FURNI_CREDIT_WIDGET":
                    _local_2 = new FurnitureCreditWidgetHandler();
                    break;
                case "RWE_FURNI_STICKIE_WIDGET":
                    _local_2 = new FurnitureStickieWidgetHandler();
                    break;
                case "RWE_FURNI_PRESENT_WIDGET":
                    _local_2 = new FurniturePresentWidgetHandler();
                    break;
                case "RWE_FURNI_TROPHY_WIDGET":
                    _local_2 = new FurnitureTrophyWidgetHandler();
                    break;
                case "RWE_FURNI_ECOTRONBOX_WIDGET":
                    _local_2 = new FurnitureEcotronBoxWidgetHandler();
                    break;
                case "RWE_FURNI_PET_PACKAGE_WIDGET":
                    _local_2 = new PetPackageFurniWidgetHandler();
                    break;
                case "RWE_DOORBELL":
                    _local_2 = new DoorbellWidgetHandler();
                    break;
                case "RWE_ROOM_QUEUE":
                    _local_2 = new RoomQueueWidgetHandler();
                    break;
                case "RWE_LOADINGBAR":
                    _local_2 = new LoadingBarWidgetHandler();
                    break;
                case "RWE_ROOM_POLL":
                    _local_2 = new PollWidgetHandler();
                    break;
                case "RWE_WORD_QUIZZ":
                    _local_2 = new WordQuizWidgetHandler();
                    break;
                case "RWE_FURNI_CHOOSER":
                    _local_2 = new FurniChooserWidgetHandler();
                    break;
                case "RWE_USER_CHOOSER":
                    _local_2 = new UserChooserWidgetHandler();
                    break;
                case "RWE_ROOM_DIMMER":
                    _local_2 = new FurnitureDimmerWidgetHandler();
                    break;
                case "RWE_FRIEND_REQUEST":
                    _local_2 = new FriendRequestWidgetHandler();
                    break;
                case "RWE_CLOTHING_CHANGE":
                    _local_2 = new FurnitureClothingChangeWidgetHandler();
                    break;
                case "RWE_CONVERSION_TRACKING":
                    _local_2 = new ConversionPointWidgetHandler();
                    break;
                case "RWE_AVATAR_INFO":
                    _local_2 = new AvatarInfoWidgetHandler();
                    break;
                case "RWE_PLAYLIST_EDITOR_WIDGET":
                    _local_15 = new PlayListEditorWidgetHandler();
                    _local_15.connection = _connection;
                    _local_2 = (_local_15 as IRoomWidgetHandler);
                    break;
                case "RWE_SPAMWALL_POSTIT_WIDGET":
                    _local_3 = new SpamWallPostItWidgetHandler();
                    _local_3.connection = _connection;
                    _local_2 = (_local_3 as IRoomWidgetHandler);
                    break;
                case "RWE_EFFECTS":
                    _local_2 = new _SafeStr_3379();
                    break;
                case "RWE_MANNEQUIN":
                    _local_2 = new MannequinWidgetHandler();
                    break;
                case "RWE_FURNITURE_CONTEXT_MENU":
                    _local_5 = new FurnitureContextMenuWidgetHandler();
                    _local_5.connection = _connection;
                    _local_2 = (_local_5 as IRoomWidgetHandler);
                    break;
                case "RWE_LOCATION_WIDGET":
                    _local_2 = new ObjectLocationRequestHandler();
                    break;
                case "RWE_CAMERA":
                    _local_2 = new CameraWidgetHandler(this);
                    break;
                case "RWE_ROOM_BACKGROUND_COLOR":
                    _local_2 = new FurnitureBackgroundColorWidgetHandler();
                    break;
                case "RWE_CUSTOM_USER_NOTIFICATION":
                    _local_2 = new CustomUserNotificationWidgetHandler();
                    break;
                case "RWE_FURNI_ACHIEVEMENT_RESOLUTION_ENGRAVING":
                    _local_2 = new _SafeStr_3316();
                    break;
                case "RWE_FRIEND_FURNI_CONFIRM":
                    _local_2 = new _SafeStr_3374();
                    _SafeStr_3374(_local_2).connection = connection;
                    break;
                case "RWE_FRIEND_FURNI_ENGRAVING":
                    _local_2 = new _SafeStr_3305();
                    break;
                case "RWE_HIGH_SCORE_DISPLAY":
                    _local_2 = new _SafeStr_3313();
                    break;
                case "RWE_INTERNAL_LINK":
                    _local_2 = new _SafeStr_3318();
                    break;
                case "RWE_ROOM_LINK":
                    _local_10 = new FurnitureRoomLinkHandler();
                    _local_10.communicationManager = _communicationManager;
                    _local_2 = _local_10;
                    break;
                case "RWE_CUSTOM_STACK_HEIGHT":
                    _local_2 = new _SafeStr_3328();
                    break;
                case "RWE_YOUTUBE":
                    _local_2 = new _SafeStr_3306();
                    break;
                case "RWE_RENTABLESPACE":
                    _local_2 = new _SafeStr_3304();
                    break;
                case "RWE_VIMEO":
                    _local_2 = new _SafeStr_3372();
                    break;
                case "RWE_ROOM_TOOLS":
                    _local_7 = new RoomToolsWidgetHandler();
                    _local_7.communicationManager = _communicationManager;
                    _local_7.navigator = _navigator;
                    _local_2 = _local_7;
                    break;
                case "RWE_EXTERNAL_IMAGE":
                    _local_2 = new ExternalImageWidgetHandler();
                    break;
                case "RWE_UI_HELP_BUBBLE":
                    _local_2 = new UiHelpBubbleWidgetHandler();
                    break;
                case "RWE_ROOM_THUMBNAIL_CAMERA":
                    _local_2 = new RoomThumbnailCameraWidgetHandler(this);
                    break;
                case "RWE_CRAFTING":
                    _local_2 = new CraftingWidgetHandler(this);
            };
            if (_local_2 != null)
            {
                _local_2.container = this;
                _local_12 = null;
                _local_13 = _local_2.getWidgetMessages();
                if (_local_13 != null)
                {
                    for each (var _local_9:String in _local_13)
                    {
                        _local_12 = _SafeStr_4347.getValue(_local_9);
                        if (_local_12 == null)
                        {
                            _local_12 = [];
                            _SafeStr_4347.add(_local_9, _local_12);
                        };
                        _local_12.push(_local_2);
                    };
                };
                _local_16 = _local_2.getProcessedEvents();
                if (_local_16 != null)
                {
                    _local_16.push("RETWE_OPEN_WIDGET");
                    _local_16.push("RETWE_CLOSE_WIDGET");
                    for each (var _local_14:String in _local_16)
                    {
                        _local_12 = _SafeStr_4348.getValue(_local_14);
                        if (_local_12 == null)
                        {
                            _local_12 = [];
                            _SafeStr_4348.add(_local_14, _local_12);
                        };
                        _local_12.push(_local_2);
                    };
                };
            };
            _local_4 = _SafeStr_3938.createWidget(_arg_1, _local_2);
            if (_local_4 == null)
            {
                return;
            };
            _local_4.messageListener = this;
            _local_4.registerUpdateEvents(_SafeStr_3983);
            if (!_SafeStr_4346.add(_arg_1, _local_4))
            {
                _local_4.dispose();
            }
            else
            {
                _SafeStr_4344.addWidgetWindow(_arg_1, _local_4.mainWindow);
            };
            if (_local_8)
            {
                _arg_1 = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
                _local_11 = new RoomWidgetRoomViewUpdateEvent(_arg_1, _SafeStr_4344.roomViewRect);
                this.events.dispatchEvent(_local_11);
            };
        }

        private function isGameWidget(_arg_1:String):Boolean
        {
            switch (_arg_1)
            {
                case "RWE_CHAT_INPUT_WIDGET":
                case "RWE_CHAT_WIDGET":
                case "RWE_AVATAR_INFO":
                case "RWE_LOCATION_WIDGET":
                    return (true);
                default:
                    return (false);
            };
        }

        public function disposeWidget(_arg_1:String):void
        {
            var _local_2:* = null;
            if (_SafeStr_4346 != null)
            {
                _local_2 = _SafeStr_4346.remove(_arg_1);
                if (_local_2 != null)
                {
                    if (_SafeStr_4344 != null)
                    {
                        _SafeStr_4344.removeWidgetWindow(_arg_1, _local_2.mainWindow);
                    };
                    _local_2.dispose();
                };
            };
        }

        public function getWidget(_arg_1:String):IRoomWidget
        {
            var _local_2:* = null;
            if (_SafeStr_4346 != null)
            {
                _local_2 = _SafeStr_4346[_arg_1];
            };
            return (_local_2);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_4:* = null;
            if (_arg_1 == null)
            {
                return (null);
            };
            if (_arg_1.type == "RWZTM_ZOOM_TOGGLE")
            {
                toggleZoom();
            };
            var _local_3:Array = _SafeStr_4347.getValue(_arg_1.type);
            if (_local_3 != null)
            {
                for each (var _local_2:IRoomWidgetHandler in _local_3)
                {
                    _local_4 = _local_2.processWidgetMessage(_arg_1);
                    if (_local_4 != null)
                    {
                        return (_local_4);
                    };
                };
            };
            return (null);
        }

        public function processEvent(_arg_1:Event):void
        {
            var _local_3:Boolean;
            var _local_5:* = null;
            if (((!(_arg_1)) || (!(_SafeStr_4348))))
            {
                return;
            };
            if (((_SafeStr_4343) && (_arg_1.type == "RDMZEE_ENABLED")))
            {
                checkAndEnableMouseZoomEvent(_SafeStr_4343.getDisplayObject());
            };
            var _local_4:Array = _SafeStr_4348.getValue(_arg_1.type);
            if (_local_4 != null)
            {
                for each (var _local_2:IRoomWidgetHandler in _local_4)
                {
                    _local_3 = true;
                    if (((_arg_1.type == "RETWE_OPEN_WIDGET") || (_arg_1.type == "RETWE_CLOSE_WIDGET")))
                    {
                        _local_5 = (_arg_1 as RoomEngineToWidgetEvent);
                        _local_3 = ((!(_local_5 == null)) && (_local_2.type == _local_5.widget));
                    };
                    if (_arg_1.type == "RWZTM_ZOOM_TOGGLE")
                    {
                        toggleZoom();
                    };
                    if (_local_3)
                    {
                        _local_2.processEvent(_arg_1);
                    };
                };
            };
        }

        private function isFurnitureSelectionDisabled(_arg_1:RoomEngineObjectEvent):Boolean
        {
            var _local_4:* = null;
            var _local_3:Boolean;
            var _local_2:IRoomObject = roomEngine.getRoomObject(_arg_1.roomId, _arg_1.objectId, _arg_1.category);
            if (_local_2 != null)
            {
                _local_4 = _local_2.getModel();
                if (_local_4 != null)
                {
                    if (_local_4.getNumber("furniture_selection_disable") == 1)
                    {
                        _local_3 = true;
                        if (_sessionDataManager.isAnyRoomController)
                        {
                            _local_3 = false;
                        };
                    };
                };
            };
            return (_local_3);
        }

        public function roomObjectEventHandler(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_7:* = null;
            var _local_10:* = null;
            var _local_12:* = null;
            var _local_8:int;
            var _local_4:int;
            var _local_2:Boolean;
            var _local_11:int;
            if (_arg_1 == null)
            {
                return;
            };
            var _local_5:int = _arg_1.objectId;
            var _local_6:int = _arg_1.category;
            var _local_3:RoomWidgetRoomObjectUpdateEvent;
            var _local_9:RoomWidgetFurniToWidgetMessage;
            switch (_arg_1.type)
            {
                case "REOE_SELECTED":
                    if (!isFurnitureSelectionDisabled(_arg_1))
                    {
                        _local_3 = new RoomWidgetRoomObjectUpdateEvent("RWROUE_OBJECT_SELECTED", _local_5, _local_6, _arg_1.roomId);
                    };
                    if (((!(_moderation == null)) && (_local_6 == 100)))
                    {
                        _local_10 = _session.userDataManager.getUserDataByIndex(_local_5);
                        if (((!(_local_10 == null)) && (_local_10.type == 1)))
                        {
                            _moderation.userSelected(_local_10.webID, _local_10.name);
                        };
                    };
                    break;
                case "REOE_ADDED":
                    switch (_local_6)
                    {
                        case 10:
                        case 20:
                            _local_7 = "RWROUE_FURNI_ADDED";
                            break;
                        case 100:
                            _local_7 = "RWROUE_USER_ADDED";
                    };
                    if (_local_7 != null)
                    {
                        _local_3 = new RoomWidgetRoomObjectUpdateEvent(_local_7, _local_5, _local_6, _arg_1.roomId);
                    };
                    break;
                case "REOE_REMOVED":
                    switch (_local_6)
                    {
                        case 10:
                        case 20:
                            _local_7 = "RWROUE_FURNI_REMOVED";
                            break;
                        case 100:
                            _local_7 = "RWROUE_USER_REMOVED";
                    };
                    if (_local_7 != null)
                    {
                        _local_3 = new RoomWidgetRoomObjectUpdateEvent(_local_7, _local_5, _local_6, _arg_1.roomId);
                    };
                    break;
                case "REOE_DESELECTED":
                    _local_3 = new RoomWidgetRoomObjectUpdateEvent("RWROUE_OBJECT_DESELECTED", _local_5, _local_6, _arg_1.roomId);
                    break;
                case "REOE_MOUSE_ENTER":
                    _local_3 = new RoomWidgetRoomObjectUpdateEvent("RWROUE_OBJECT_ROLL_OVER", _local_5, _local_6, _arg_1.roomId);
                    break;
                case "REOE_MOUSE_LEAVE":
                    _local_3 = new RoomWidgetRoomObjectUpdateEvent("RWROUE_OBJECT_ROLL_OUT", _local_5, _local_6, _arg_1.roomId);
                    break;
                case "REOE_REQUEST_MOVE":
                    if (checkFurniManipulationRights(_arg_1.roomId, _arg_1.objectId, _arg_1.category))
                    {
                        _roomEngine.modifyRoomObject(_arg_1.objectId, _arg_1.category, "OBJECT_MOVE");
                    };
                    break;
                case "REOE_REQUEST_ROTATE":
                    if (checkFurniManipulationRights(_arg_1.roomId, _arg_1.objectId, _arg_1.category))
                    {
                        _roomEngine.modifyRoomObject(_arg_1.objectId, _arg_1.category, "OBJECT_ROTATE_POSITIVE");
                    };
                    break;
                case "RETWE_REQUEST_CREDITFURNI":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_CREDITFURNI", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_STICKIE":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_STICKIE", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_PRESENT":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_PRESENT", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_TROPHY":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_TROPHY", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_TEASER":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_TEASER", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_ECOTRONBOX":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_ECOTRONBOX", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_DIMMER":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_DIMMER", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_PLACEHOLDER":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_PLACEHOLDER", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RERAE_FURNI_CLICK":
                case "RERAE_FURNI_DOUBLE_CLICK":
                    handleRoomAdClick(_arg_1);
                    break;
                case "RERAE_TOOLTIP_SHOW":
                case "RERAE_TOOLTIP_HIDE":
                    handleRoomAdTooltip(_arg_1);
                    break;
                case "RETWE_REQUEST_CLOTHING_CHANGE":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_PLAYLIST_EDITOR":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_BADGE_DISPLAY_ENGRAVING":
                    _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING", _local_5, _local_6, _arg_1.roomId);
                    processWidgetMessage(_local_9);
                    break;
                case "RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED":
                    _local_12 = _roomEngine.getRoomObject(_arg_1.roomId, _arg_1.objectId, _arg_1.category);
                    if (_local_12 != null)
                    {
                        _local_8 = _local_12.getModel().getNumber("furniture_owner_id");
                        _local_4 = _sessionDataManager.userId;
                        if (_local_8 == _local_4)
                        {
                            _local_9 = new RoomWidgetFurniToWidgetMessage("RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED", _local_5, _local_6, _arg_1.roomId);
                            processWidgetMessage(_local_9);
                        };
                    };
                    break;
                case "RETWE_OPEN_WIDGET":
                case "RETWE_CLOSE_WIDGET":
                case "RETWE_OPEN_FURNI_CONTEXT_MENU":
                case "RETWE_CLOSE_FURNI_CONTEXT_MENU":
                case "RETWE_REMOVE_DIMMER":
                case "ROSM_JUKEBOX_DISPOSE":
                case "RETWE_REQUEST_MANNEQUIN":
                case "ROSM_USE_PRODUCT_FROM_INVENTORY":
                case "ROSM_USE_PRODUCT_FROM_ROOM":
                case "RETWE_REQUEST_BACKGROUND_COLOR":
                case "RETWE_REQUEST_FRIEND_FURNITURE_ENGRAVING":
                case "RETWE_REQUEST_HIGH_SCORE_DISPLAY":
                case "RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY":
                case "RETWE_REQUEST_INTERNAL_LINK":
                case "RETWE_REQUEST_ROOM_LINK":
                    processEvent(_arg_1);
            };
            if (_local_3 != null)
            {
                _local_2 = true;
                if ((_local_3 is RoomWidgetRoomObjectUpdateEvent))
                {
                    _local_11 = (_local_3 as RoomWidgetRoomObjectUpdateEvent).roomId;
                    _local_2 = (!(RoomId.isRoomPreviewerId(_local_11)));
                }
                else
                {
                    if ((_local_3 is RoomWidgetRoomEngineUpdateEvent))
                    {
                        _local_11 = (_local_3 as RoomWidgetRoomEngineUpdateEvent).roomId;
                        _local_2 = (!(RoomId.isRoomPreviewerId(_local_11)));
                    };
                };
                if (_local_2)
                {
                    events.dispatchEvent(_local_3);
                };
            };
        }

        private function checkFurniManipulationRights(_arg_1:int, _arg_2:int, _arg_3:int):Boolean
        {
            return (((_session.roomControllerLevel >= 1) || (_sessionDataManager.isAnyRoomController)) || (isOwnerOfFurniture(_roomEngine.getRoomObject(_arg_1, _arg_2, _arg_3))));
        }

        public function roomEngineEventHandler(_arg_1:RoomEngineEvent):void
        {
            var _local_2:RoomWidgetUpdateEvent;
            switch (_arg_1.type)
            {
                case "REE_NORMAL_MODE":
                    _local_2 = new RoomWidgetRoomEngineUpdateEvent("RWREUE_NORMAL_MODE", _arg_1.roomId);
                    break;
                case "REE_GAME_MODE":
                    _local_2 = new RoomWidgetRoomEngineUpdateEvent("RWREUE_GAME_MODE", _arg_1.roomId);
            };
            if (_local_2 != null)
            {
                events.dispatchEvent(_local_2);
            };
        }

        public function createRoomView(_arg_1:int):void
        {
            var _local_15:Number;
            var _local_5:Number;
            var _local_14:Number;
            var _local_4:Number;
            var _local_13:Number;
            var _local_10:Number;
            var _local_8:Number;
            var _local_11:Number;
            var _local_6:* = null;
            var _local_3:Rectangle = _SafeStr_4344.roomViewRect;
            var _local_16:int = _local_3.width;
            var _local_22:int = _local_3.height;
            var _local_7:int = ((_session.isGameSession) ? 32 : 64);
            if (_SafeStr_4345.indexOf(_arg_1) >= 0)
            {
                return;
            };
            if ((((_session == null) || (_windowManager == null)) || (_roomEngine == null)))
            {
                return;
            };
            var _local_17:DisplayObject = _roomEngine.createRoomCanvas(_session.roomId, _arg_1, _local_16, _local_22, _local_7);
            if (_local_17 == null)
            {
                return;
            };
            var _local_18:RoomGeometry = (_roomEngine.getRoomCanvasGeometry(_session.roomId, _arg_1) as RoomGeometry);
            if (_local_18 != null)
            {
                _local_15 = _roomEngine.getRoomNumberValue(_session.roomId, "room_min_x");
                _local_5 = _roomEngine.getRoomNumberValue(_session.roomId, "room_max_x");
                _local_14 = _roomEngine.getRoomNumberValue(_session.roomId, "room_min_y");
                _local_4 = _roomEngine.getRoomNumberValue(_session.roomId, "room_max_y");
                _local_13 = ((_local_15 + _local_5) / 2);
                _local_10 = ((_local_14 + _local_4) / 2);
                _local_8 = 20;
                _local_13 = (_local_13 + (_local_8 - 1));
                _local_10 = (_local_10 + (_local_8 - 1));
                _local_11 = (Math.sqrt(((_local_8 * _local_8) + (_local_8 * _local_8))) * Math.tan((0.166666666666667 * 3.14159265358979)));
                _local_18.location = new Vector3d(_local_13, _local_10, _local_11);
            };
            var _local_20:XmlAsset = (_assets.getAssetByName("room_view_container_xml") as XmlAsset);
            if (_local_20 == null)
            {
                return;
            };
            var _local_9:_SafeStr_3133 = (_windowManager.buildFromXML((_local_20.content as XML)) as _SafeStr_3133);
            if (_local_9 == null)
            {
                return;
            };
            _local_9.width = _local_16;
            _local_9.height = _local_22;
            _SafeStr_4343 = (_local_9.findChildByName("room_canvas_wrapper") as _SafeStr_3189);
            if (_SafeStr_4343 == null)
            {
                return;
            };
            _SafeStr_4343.setDisplayObject(_local_17);
            if (_session.isGameSession)
            {
                _local_17.addEventListener("click", mouseEventHandler);
            };
            checkAndEnableMouseZoomEvent(_local_17);
            _SafeStr_4343.addEventListener("WME_CLICK", canvasMouseHandler);
            _SafeStr_4343.addEventListener("WME_DOUBLE_CLICK", canvasMouseHandler);
            _SafeStr_4343.addEventListener("WME_MOVE", canvasMouseHandler);
            _SafeStr_4343.addEventListener("WME_DOWN", canvasMouseHandler);
            _SafeStr_4343.addEventListener("WME_UP", canvasMouseHandler);
            _SafeStr_4343.addEventListener("WME_UP_OUTSIDE", canvasMouseHandler);
            _SafeStr_4343.addEventListener("WE_RESIZED", onRoomViewResized);
            var _local_19:Sprite = new Sprite();
            _local_19.mouseEnabled = false;
            _local_19.blendMode = "multiply";
            var _local_21:_SafeStr_3189 = (_local_9.findChildByName("colorizer_wrapper") as _SafeStr_3189);
            if (_local_21 == null)
            {
                return;
            };
            _local_21.setDisplayObject(_local_19);
            _local_21.addEventListener("WE_RESIZED", resizeColorizer);
            var _local_2:Sprite = new Sprite();
            _local_2.mouseEnabled = false;
            var _local_12:_SafeStr_3189 = (_local_9.findChildByName("background_wrapper") as _SafeStr_3189);
            if (_local_12 == null)
            {
                return;
            };
            _local_12.setDisplayObject(_local_2);
            _local_12.addEventListener("WE_RESIZED", resizeBackgroundColorizer);
            if (_session.isSpectatorMode)
            {
                _local_6 = getSpectatorModeVisualization();
                if (_local_6 != null)
                {
                    _local_6.width = _local_9.width;
                    _local_6.height = _local_9.height;
                    _local_9.addChild(_local_6);
                };
            };
            _SafeStr_4344.addRoomView(_local_9);
            _SafeStr_4345.push(_arg_1);
        }

        private function checkAndEnableMouseZoomEvent(_arg_1:DisplayObject):void
        {
            _arg_1.removeEventListener("mouseWheel", mouseWheelHandler);
            if (_sessionDataManager.isPerkAllowed("MOUSE_ZOOM"))
            {
                _arg_1.addEventListener("mouseWheel", mouseWheelHandler);
            };
        }

        private function mouseWheelHandler(_arg_1:MouseEvent):void
        {
            var _local_3:* = null;
            var _local_2:int;
            var _local_4:int;
            if ((((_arg_1.ctrlKey) && (!(_arg_1.altKey))) && (!(_arg_1.shiftKey))))
            {
                _SafeStr_4350 = (_SafeStr_4350 + ((_arg_1.delta == 0) ? 0 : ((_arg_1.delta < 0) ? -20 : 20)));
                _local_3 = new Point();
                _SafeStr_4343.getGlobalPosition(_local_3);
                _local_2 = (_arg_1.stageX - _local_3.x);
                _local_4 = (_arg_1.stageY - _local_3.y);
                _SafeStr_4353 = new Point(_local_2, _local_4);
            };
        }

        private function resizeColorizer(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3189 = (_arg_1.target as _SafeStr_3189);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:Sprite = (_local_2.getDisplayObject() as Sprite);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.graphics.clear();
            _local_3.graphics.beginFill(_roomColor);
            _local_3.graphics.drawRect(0, 0, _local_2.width, _local_2.height);
            _local_3.graphics.endFill();
        }

        private function resizeBackgroundColorizer(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3189 = (_arg_1.target as _SafeStr_3189);
            if (_local_2 == null)
            {
                return;
            };
            fillBackgroundColorizer(_local_2);
        }

        private function fillBackgroundColorizer(_arg_1:_SafeStr_3189):void
        {
            var _local_2:Sprite = (_arg_1.getDisplayObject() as Sprite);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.graphics.clear();
            _local_2.graphics.beginFill(_roomBackgroundColor);
            _local_2.graphics.drawRect(0, 0, _arg_1.width, _arg_1.height);
            _local_2.graphics.endFill();
        }

        public function setRoomViewColor(_arg_1:uint, _arg_2:int):void
        {
            var _local_5:_SafeStr_3133 = (_SafeStr_4344.getRoomView() as _SafeStr_3133);
            if (_local_5 == null)
            {
                return;
            };
            var _local_6:_SafeStr_3189 = (_local_5.getChildByName("colorizer_wrapper") as _SafeStr_3189);
            if (_local_6 == null)
            {
                return;
            };
            var _local_4:Sprite = (_local_6.getDisplayObject() as Sprite);
            if (_local_4 == null)
            {
                return;
            };
            var _local_3:int = ColorConverter.rgbToHSL(_arg_1);
            _local_3 = ((_local_3 & 0xFFFF00) + _arg_2);
            _arg_1 = ColorConverter.hslToRGB(_local_3);
            _roomColor = _arg_1;
            _local_4.graphics.clear();
            _local_4.graphics.beginFill(_arg_1);
            _local_4.graphics.drawRect(0, 0, _local_6.width, _local_6.height);
            _local_4.graphics.endFill();
        }

        public function setRoomBackgroundColor(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            _roomBackgroundColor = ColorConverter.hslToRGB(((((_arg_1 & 0xFF) << 16) + ((_arg_2 & 0xFF) << 8)) + (_arg_3 & 0xFF)));
            var _local_4:_SafeStr_3133 = (_SafeStr_4344.getRoomView() as _SafeStr_3133);
            if (_local_4 == null)
            {
                return;
            };
            var _local_5:_SafeStr_3189 = (_local_4.getChildByName("background_wrapper") as _SafeStr_3189);
            if (_local_5 == null)
            {
                return;
            };
            if ((((_arg_1 == 0) && (_arg_2 == 0)) && (_arg_3 == 0)))
            {
                _local_5.visible = false;
            }
            else
            {
                _local_5.visible = true;
                fillBackgroundColorizer(_local_5);
            };
        }

        public function getFirstCanvasId():int
        {
            if (_SafeStr_4345 != null)
            {
                if (_SafeStr_4345.length > 0)
                {
                    return (_SafeStr_4345[0]);
                };
            };
            return (0);
        }

        public function getRoomViewRect():Rectangle
        {
            if (!_SafeStr_4344)
            {
                return (null);
            };
            return (_SafeStr_4344.roomViewRect);
        }

        public function addListenerToStage(_arg_1:String, _arg_2:Function):void
        {
            if ((((!(_SafeStr_4343)) || (!(_SafeStr_4343.getDisplayObject()))) || (!(_SafeStr_4343.getDisplayObject().stage))))
            {
                return;
            };
            _SafeStr_4343.getDisplayObject().stage.addEventListener(_arg_1, _arg_2, false, 0, true);
        }

        public function removeListenerFromStage(_arg_1:String, _arg_2:Function):void
        {
            if ((((!(_SafeStr_4343)) || (!(_SafeStr_4343.getDisplayObject()))) || (!(_SafeStr_4343.getDisplayObject().stage))))
            {
                return;
            };
            _SafeStr_4343.getDisplayObject().stage.removeEventListener(_arg_1, _arg_2);
        }

        public function canvasMouseHandler(_arg_1:_SafeStr_3116):void
        {
            var _local_5:* = null;
            var _local_3:int;
            var _local_7:int;
            var _local_6:* = null;
            if (((_roomEngine == null) || (_session == null)))
            {
                return;
            };
            var _local_4:WindowMouseEvent = (_arg_1 as WindowMouseEvent);
            if (_local_4 == null)
            {
                return;
            };
            var _local_8:String = "";
            switch (_local_4.type)
            {
                case "WME_CLICK":
                    _local_8 = "click";
                    break;
                case "WME_DOUBLE_CLICK":
                    _local_8 = "doubleClick";
                    break;
                case "WME_DOWN":
                    _local_8 = "mouseDown";
                    break;
                case "WME_UP":
                case "WME_UP_OUTSIDE":
                    _local_8 = "mouseUp";
                    break;
                case "WME_MOVE":
                    _local_8 = "mouseMove";
                    break;
                default:
                    return;
            };
            var _local_2:_SafeStr_3189 = (_local_4.target as _SafeStr_3189);
            if (_local_2 == _local_4.target)
            {
                _local_5 = new Point();
                _local_2.getGlobalPosition(_local_5);
                _local_3 = (_local_4.stageX - _local_5.x);
                _local_7 = (_local_4.stageY - _local_5.y);
                _roomEngine.setActiveRoom(_session.roomId);
                _roomEngine.handleRoomCanvasMouseEvent(_SafeStr_4345[0], _local_3, _local_7, _local_8, _local_4.altKey, _local_4.ctrlKey, _local_4.shiftKey, _local_4.buttonDown);
            };
            if (((_local_8 == "mouseMove") && (!(_SafeStr_4349 == null))))
            {
                _local_6 = new Point(_local_4.stageX, _local_4.stageY);
                _local_6.offset((-(_SafeStr_4349.width) / 2), 15);
                _SafeStr_4349.setGlobalPosition(_local_6);
            };
        }

        private function mouseEventHandler(_arg_1:MouseEvent):void
        {
            var _local_3:Point = new Point();
            _SafeStr_4343.getGlobalPosition(_local_3);
            var _local_2:int = (_arg_1.stageX - _local_3.x);
            var _local_4:int = (_arg_1.stageY - _local_3.y);
            _roomEngine.setActiveRoom(_session.roomId);
            _arg_1.stopImmediatePropagation();
            _roomEngine.handleRoomCanvasMouseEvent(_SafeStr_4345[0], _local_2, _local_4, _arg_1.type, _arg_1.altKey, _arg_1.ctrlKey, _arg_1.shiftKey, _arg_1.buttonDown);
        }

        private function onRoomViewResized(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.window;
            _SafeStr_4351 = _local_2.rectangle;
            _roomEngine.modifyRoomCanvas(_session.roomId, _SafeStr_4345[0], _local_2.width, _local_2.height);
            if (_SafeStr_4078 == null)
            {
                _SafeStr_4078 = new Timer(1000, 1);
                _SafeStr_4078.addEventListener("timer", onResizeTimerEvent);
            }
            else
            {
                _SafeStr_4078.reset();
            };
            _SafeStr_4078.start();
        }

        private function onResizeTimerEvent(_arg_1:TimerEvent):void
        {
            var _local_2:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
            events.dispatchEvent(new RoomWidgetRoomViewUpdateEvent(_local_2, _SafeStr_4351));
        }

        private function trackZooming(_arg_1:Boolean, _arg_2:Boolean):void
        {
            var _local_3:int;
            var _local_4:int;
            if (_SafeStr_4352)
            {
                _local_3 = getTimer();
                _local_4 = int(Math.round(((_local_3 - _zoomChangedMillis) / 1000)));
                if (_habboTracking != null)
                {
                    if (_arg_1)
                    {
                        if (_arg_2)
                        {
                            _habboTracking.trackGoogle("zoomEvent", "out");
                        };
                        _habboTracking.trackGoogle("zoomEnded", "in", _local_4);
                    }
                    else
                    {
                        if (_arg_2)
                        {
                            _habboTracking.trackGoogle("zoomEvent", "in");
                        };
                        _habboTracking.trackGoogle("zoomEnded", "out", _local_4);
                    };
                };
                _zoomChangedMillis = _local_3;
            };
        }

        private function onToolbarEvent(_arg_1:HabboToolbarEvent):void
        {
            if (_arg_1.type == "HTIE_ICON_ZOOM")
            {
                toggleZoom();
            };
        }

        private function toggleZoom():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:* = null;
            if (_session != null)
            {
                if ((_roomEngine as _SafeStr_20).getBoolean("zoom.enabled"))
                {
                    _local_1 = _roomEngine.getRoomCanvasScale(_roomEngine.activeRoomId);
                    _local_2 = ((_local_1 == 1) ? 0.5 : 1);
                    _roomEngine.setRoomCanvasScale(_roomEngine.activeRoomId, getFirstCanvasId(), _local_2);
                }
                else
                {
                    _local_3 = _roomEngine.getRoomCanvasGeometry(_session.roomId, getFirstCanvasId());
                    if (_local_3 != null)
                    {
                        trackZooming(_local_3.isZoomedIn(), true);
                        _local_3.performZoom();
                    };
                };
            };
        }

        public function update():void
        {
            var _local_6:Number;
            var _local_4:int;
            var _local_2:* = null;
            var _local_1:Number;
            var _local_7:Number;
            var _local_5:Number;
            if (_updateListeners == null)
            {
                return;
            };
            var _local_3:int = _updateListeners.length;
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = (_updateListeners[_local_4] as IRoomWidgetHandler);
                if (_local_2 != null)
                {
                    _local_2.update();
                };
                _local_4++;
            };
            if (Math.abs(_SafeStr_4350) > 0.01)
            {
                _local_6 = _roomEngine.getRoomCanvasScale(_roomEngine.activeRoomId);
                _local_1 = hibit(_local_6);
                _local_7 = (((_local_1 > 1) ? (_local_1 << 1) : 1) / 10);
                _local_5 = ((_SafeStr_4350 > 0) ? (_local_6 - _local_7) : (_local_6 + _local_7));
                _local_5 = Math.max(0.5, _local_5);
                _SafeStr_4354 = true;
                _SafeStr_4350 = (_SafeStr_4350 * 0.05);
                _roomEngine.setRoomCanvasScale(_session.roomId, getFirstCanvasId(), _local_5, _SafeStr_4353, null, false, true);
            }
            else
            {
                if (_SafeStr_4354)
                {
                    _SafeStr_4354 = false;
                    _local_6 = _roomEngine.getRoomCanvasScale(_roomEngine.activeRoomId);
                    if (_local_6 < 0.75)
                    {
                        _roomEngine.setRoomCanvasScale(_session.roomId, getFirstCanvasId(), 0.5, _SafeStr_4353, null, false, true);
                    }
                    else
                    {
                        _roomEngine.setRoomCanvasScale(_session.roomId, getFirstCanvasId(), Math.round(_local_6), _SafeStr_4353, null, false, true);
                    };
                };
            };
        }

        private function hibit(_arg_1:int):int
        {
            _arg_1 = (_arg_1 | (_arg_1 >> 1));
            _arg_1 = (_arg_1 | (_arg_1 >> 2));
            _arg_1 = (_arg_1 | (_arg_1 >> 4));
            _arg_1 = (_arg_1 | (_arg_1 >> 8));
            _arg_1 = (_arg_1 | (_arg_1 >> 16));
            return (_arg_1 - (_arg_1 >> 1));
        }

        private function getWindowName(_arg_1:int):String
        {
            return ("Room_Engine_Window_" + _arg_1);
        }

        private function createFilter(_arg_1:int, _arg_2:int):Array
        {
            var _local_3:BlurFilter = new BlurFilter(2, 2);
            return ([]);
        }

        private function getBitmapFilter(_arg_1:int, _arg_2:int):BitmapFilter
        {
            var _local_9:BitmapData = new BitmapData(_arg_1, _arg_2);
            _local_9.perlinNoise(_arg_1, _arg_2, 5, (Math.random() * 0x77359400), true, false);
            var _local_6:Point = new Point(0, 0);
            var _local_7:uint = 1;
            var _local_12:* = _local_7;
            var _local_11:* = _local_7;
            var _local_3:Number = (_arg_1 / 20);
            var _local_5:Number = (-(_arg_1) / 25);
            var _local_4:String = "color";
            var _local_8:uint;
            var _local_10:* = 0;
            return (new DisplacementMapFilter(_local_9, _local_6, _local_12, _local_11, _local_3, _local_5, _local_4, _local_8, _local_10));
        }

        private function checkInterrupts():Boolean
        {
            if ((((!(_roomSessionManager == null)) && (!(_session == null))) && (_SafeStr_4355)))
            {
                _roomSessionManager.startSession(_session);
                processEvent(new RoomWidgetLoadingBarUpdateEvent("RWLBUW_HIDE_LOADING_BAR"));
                return (true);
            };
            return (false);
        }

        private function handleRoomAdClick(_arg_1:RoomEngineObjectEvent):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_4:IRoomObject = _roomEngine.getRoomObject(_arg_1.roomId, _arg_1.objectId, _arg_1.category);
            if (_local_4 == null)
            {
                return;
            };
            var _local_3:IRoomObjectModel = (_local_4.getModel() as IRoomObjectModel);
            var _local_2:String = _local_3.getString("furniture_ad_url");
            if (((_local_2 == null) || (!(_local_2.indexOf("http") == 0))))
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "RERAE_FURNI_CLICK":
                    if (((_session.roomControllerLevel >= 1) || (_sessionDataManager.isAnyRoomController)))
                    {
                        return;
                    };
                    HabboWebTools.openWebPage(_local_2);
                    return;
                case "RERAE_FURNI_DOUBLE_CLICK":
                    if ((((!(_session.roomControllerLevel)) >= 1) && (!(_sessionDataManager.isAnyRoomController))))
                    {
                        return;
                    };
                    HabboWebTools.openWebPage(_local_2);
                    return;
            };
        }

        private function handleRoomAdTooltip(_arg_1:RoomEngineObjectEvent):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "RERAE_TOOLTIP_SHOW":
                    if (_SafeStr_4349 != null)
                    {
                        return;
                    };
                    _local_3 = _roomEngine.getRoomObject(_arg_1.roomId, _arg_1.objectId, _arg_1.category);
                    if (_local_3 == null)
                    {
                        return;
                    };
                    _local_4 = _localization.getLocalization((_local_3.getType() + ".tooltip"), "${ads.roomad.tooltip}");
                    if (_local_4 == null)
                    {
                        _local_5 = (_local_3.getModel() as IRoomObjectModel);
                        _local_2 = _local_5.getString("furniture_ad_url");
                        if (((!(_local_2 == null)) && (_local_2.indexOf("http") == 0)))
                        {
                            _local_4 = _local_2;
                        };
                    };
                    if (_local_4 == null)
                    {
                        return;
                    };
                    _SafeStr_4349 = (_windowManager.createWindow("room_ad_tooltip", _local_4, 8, 0, 32) as IToolTipWindow);
                    _SafeStr_4349.setParamFlag(1, false);
                    _SafeStr_4349.visible = true;
                    _SafeStr_4349.center();
                    return;
                case "RERAE_TOOLTIP_HIDE":
                    if (_SafeStr_4349 == null)
                    {
                        return;
                    };
                    _SafeStr_4349.dispose();
                    _SafeStr_4349 = null;
                    return;
            };
        }

        private function getSpectatorModeVisualization():_SafeStr_3109
        {
            var _local_2:XmlAsset = (_assets.getAssetByName("spectator_mode_xml") as XmlAsset);
            if (_local_2 == null)
            {
                return (null);
            };
            var _local_1:_SafeStr_3133 = (_windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            if (_local_1 == null)
            {
                return (null);
            };
            setBitmap(_local_1.findChildByName("top_left"), "spec_top_left_png");
            setBitmap(_local_1.findChildByName("top_middle"), "spec_top_middle_png");
            setBitmap(_local_1.findChildByName("top_right"), "spec_top_right_png");
            setBitmap(_local_1.findChildByName("middle_left"), "spec_middle_left_png");
            setBitmap(_local_1.findChildByName("middle_right"), "spec_middle_right_png");
            setBitmap(_local_1.findChildByName("bottom_left"), "spec_bottom_left_png");
            setBitmap(_local_1.findChildByName("bottom_middle"), "spec_bottom_middle_png");
            setBitmap(_local_1.findChildByName("bottom_right"), "spec_bottom_right_png");
            return (_local_1);
        }

        private function setBitmap(_arg_1:_SafeStr_3109, _arg_2:String):void
        {
            var _local_4:_SafeStr_3264 = (_arg_1 as _SafeStr_3264);
            if (((_local_4 == null) || (_assets == null)))
            {
                return;
            };
            var _local_5:BitmapDataAsset = (_assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (_local_5 == null)
            {
                return;
            };
            var _local_3:BitmapData = (_local_5.content as BitmapData);
            if (_local_3 == null)
            {
                return;
            };
            _local_4.bitmap = _local_3.clone();
        }

        public function initializeWidget(_arg_1:String, _arg_2:int=0):void
        {
            var _local_3:IRoomWidget = _SafeStr_4346[_arg_1];
            if (_local_3 == null)
            {
                _SafeStr_14.log(("Tried to initialize an unknown widget " + _arg_1));
                return;
            };
            _local_3.initialize(_arg_2);
        }

        public function getWidgetState(_arg_1:String):int
        {
            var _local_2:IRoomWidget = _SafeStr_4346[_arg_1];
            if (_local_2 == null)
            {
                _SafeStr_14.log(("Requested the state of an unknown widget " + _arg_1));
                return (-1);
            };
            return (_local_2.state);
        }

        public function addUpdateListener(_arg_1:IRoomWidgetHandler):void
        {
            if (_updateListeners == null)
            {
                _updateListeners = [];
            };
            if (_updateListeners.indexOf(_arg_1) == -1)
            {
                _updateListeners.push(_arg_1);
            };
        }

        public function removeUpdateListener(_arg_1:IRoomWidgetHandler):void
        {
            if (_updateListeners == null)
            {
                return;
            };
            var _local_2:int = _updateListeners.indexOf(_arg_1);
            if (_local_2 != -1)
            {
                _updateListeners.splice(_local_2, 1);
            };
        }

        public function isOwnerOfFurniture(_arg_1:IRoomObject):Boolean
        {
            var _local_4:int = sessionDataManager.userId;
            var _local_3:IRoomObjectModel = _arg_1.getModel();
            if (_local_3 == null)
            {
                return (false);
            };
            var _local_2:Number = _local_3.getNumber("furniture_owner_id");
            return (_local_2 == _local_4);
        }

        public function getFurnitureOwnerId(_arg_1:IRoomObject):int
        {
            var _local_2:Number;
            var _local_3:IRoomObjectModel = _arg_1.getModel();
            if (_local_3 != null)
            {
                _local_2 = _local_3.getNumber("furniture_owner_id");
                if (!isNaN(_local_2))
                {
                    return (_local_2);
                };
            };
            return (-1);
        }

        public function isOwnerOfPet(_arg_1:_SafeStr_3241):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_2:int = sessionDataManager.userId;
            return (_local_2 == _arg_1.ownerId);
        }

        public function showGamePlayerName(_arg_1:int, _arg_2:String, _arg_3:uint, _arg_4:int):void
        {
            var _local_5:AvatarInfoWidget = (_SafeStr_4346["RWE_AVATAR_INFO"] as AvatarInfoWidget);
            if (!_local_5)
            {
                return;
            };
            _local_5.showGamePlayerName(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public function get layoutManager():_SafeStr_3343
        {
            return (_SafeStr_4344);
        }

        public function mouseEventPositionHasInputEventWindow(_arg_1:MouseEvent, _arg_2:int):Boolean
        {
            var _local_3:Array = new Array(0);
            var _local_4:Point = new Point(_arg_1.stageX, _arg_1.stageY);
            _windowManager.getDesktop(_arg_2).groupParameterFilteredChildrenUnderPoint(_local_4, _local_3, 1);
            return (_local_3.length > 1);
        }


    }
}//package com.sulake.habbo.ui

// _SafeStr_1351 = "_-wt" (String#34337, DoABC#4)
// _SafeStr_1398 = "_-12S" (String#35217, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1699 = "_-uf" (String#3285, DoABC#4)
// _SafeStr_1700 = "_-eD" (String#3930, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1703 = "_-Q1U" (String#4333, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_1705 = "_-VD" (String#7365, DoABC#4)
// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_1757 = "_-h1P" (String#4520, DoABC#4)
// _SafeStr_1758 = "_-Y5" (String#3968, DoABC#4)
// _SafeStr_177 = "_-L11" (String#26369, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2046 = "_-y13" (String#3747, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3304 = "_-cO" (String#11463, DoABC#4)
// _SafeStr_3305 = "_-pV" (String#10325, DoABC#4)
// _SafeStr_3306 = "_-I1p" (String#11328, DoABC#4)
// _SafeStr_3313 = "_-RQ" (String#7768, DoABC#4)
// _SafeStr_3316 = "_-61H" (String#14285, DoABC#4)
// _SafeStr_3318 = "_-9E" (String#15742, DoABC#4)
// _SafeStr_3328 = "_-Hk" (String#9140, DoABC#4)
// _SafeStr_3343 = "_-D1G" (String#10068, DoABC#4)
// _SafeStr_3372 = "_-yN" (String#10916, DoABC#4)
// _SafeStr_3374 = "_-n9" (String#8833, DoABC#4)
// _SafeStr_3379 = "_-gs" (String#10410, DoABC#4)
// _SafeStr_3936 = "_-Kd" (String#4174, DoABC#4)
// _SafeStr_3938 = "_-ab" (String#4849, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_4078 = "_-N1D" (String#1602, DoABC#4)
// _SafeStr_4341 = "_-O15" (String#8419, DoABC#4)
// _SafeStr_4342 = "_-K1p" (String#8376, DoABC#4)
// _SafeStr_4343 = "_-UD" (String#3114, DoABC#4)
// _SafeStr_4344 = "_-G1N" (String#4322, DoABC#4)
// _SafeStr_4345 = "_-or" (String#4772, DoABC#4)
// _SafeStr_4346 = "_-11n" (String#1019, DoABC#4)
// _SafeStr_4347 = "_-tu" (String#7413, DoABC#4)
// _SafeStr_4348 = "_-F1O" (String#6827, DoABC#4)
// _SafeStr_4349 = "_-O1o" (String#4343, DoABC#4)
// _SafeStr_4350 = "_-z1l" (String#8123, DoABC#4)
// _SafeStr_4351 = "_-K1c" (String#13403, DoABC#4)
// _SafeStr_4352 = "_-J1h" (String#30737, DoABC#4)
// _SafeStr_4353 = "_-n1x" (String#5153, DoABC#4)
// _SafeStr_4354 = "_-71y" (String#12671, DoABC#4)
// _SafeStr_4355 = "_-dS" (String#13281, DoABC#4)
// _SafeStr_4592 = "_-61V" (String#8067, DoABC#4)
// _SafeStr_578 = "_-1b" (String#24119, DoABC#4)


