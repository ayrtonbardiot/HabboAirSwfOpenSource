// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room._SafeStr_1691

package com.sulake.habbo.room
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.room.IRoomManagerListener;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.room.renderer.IRoomRendererFactory;
    import com.sulake.room.IRoomManager;
    import com.sulake.room.IRoomObjectFactory;
    import com.sulake.room.object.IRoomObjectVisualizationFactory;
    import com.sulake.habbo.advertisement._SafeStr_1705;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.room.utils.NumberBank;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.game._SafeStr_1699;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDRoomObjectFactory;
    import com.sulake.iid.IIDRoomObjectVisualizationFactory;
    import com.sulake.iid.IIDRoomManager;
    import com.sulake.iid.IIDRoomRendererFactory;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboAdManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboGameManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import __AS3__.vec.Vector;
    import flash.display.DisplayObjectContainer;
    import flash.display.LoaderInfo;
    import flash.events.Event;
    import com.sulake.habbo.room.utils._SafeStr_3110;
    import com.sulake.habbo.room.utils._SafeStr_3178;
    import com.sulake.habbo.room.utils._SafeStr_3137;
    import com.sulake.habbo.room.utils._SafeStr_3262;
    import com.sulake.habbo.room.utils._SafeStr_3120;
    import com.sulake.habbo.room.utils._SafeStr_3172;
    import com.sulake.room.utils.RoomEnterEffect;
    import flash.ui.Mouse;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.room.messages.RoomObjectRoomFloorHoleUpdateMessage;
    import flash.utils.getTimer;
    import com.sulake.room.RoomInstance;
    import com.sulake.room.renderer.IRoomRenderingCanvas;
    import com.sulake.room.utils.RoomGeometry;
    import com.sulake.room.IRoomInstance;
    import com.sulake.room.utils.Vector3d;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.room.utils._SafeStr_1662;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage;
    import com.sulake.room.utils._SafeStr_1675;
    import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage;
    import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
    import com.sulake.habbo.room.events.RoomEngineHSLColorEnableEvent;
    import com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectRoomPlanePropertyUpdateMessage;
    import com.sulake.room.renderer.IRoomRenderer;
    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.events.RoomEngineDragWithMouseEvent;
    import com.sulake.habbo.room.events.RoomEngineObjectEvent;
    import com.sulake.room.events.RoomObjectMouseEvent;
    import flash.display.Bitmap;
    import com.sulake.habbo.room.object.RoomObjectUserTypes;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectTileCursorUpdateMessage;
    import com.sulake.habbo.room.utils._SafeStr_3247;
    import com.sulake.habbo.room.object.data._SafeStr_1588;
    import com.sulake.habbo.room.messages.RoomObjectModelDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectHeightUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
    import com.sulake.habbo.utils._SafeStr_3270;
    import com.sulake.habbo.room.object.data._SafeStr_1613;
    import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
    import com.sulake.habbo.room.events.RoomToObjectOwnAvatarMoveEvent;
    import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectUpdateStateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarOwnMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarMutedUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarExperienceUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPlayerValueUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarExpressionUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPlayingGameMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarGuideStatusUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarPetGestureUpdateMessage;
    import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.core.utils._SafeStr_3235;
    import com.sulake.core.utils.images._SafeStr_3128;
    import flash.net.FileReference;
    import com.sulake.habbo.avatar.pets.PetCustomPart;
    import com.sulake.habbo.room.object.RoomPlaneParser;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
    import com.sulake.habbo.room.messages.RoomObjectRoomAdUpdateMessage;
    import com.sulake.habbo.advertisement.events.AdEvent;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.room.utils._SafeStr_3222;
    import com.sulake.habbo.room.messages.RoomObjectGroupBadgeUpdateMessage;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.habbo.room.events.RoomEngineUseProductEvent;
    import com.sulake.habbo.room.utils._SafeStr_3249;
    import com.sulake.habbo.communication.messages.outgoing.camera._SafeStr_688;
    import com.sulake.habbo.communication.messages.outgoing.camera._SafeStr_687;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.iid.*;
    import com.sulake.room.object.*;

    [SecureSWF(rename="true")]
    public class _SafeStr_1691 extends _SafeStr_20 implements IRoomEngine, IRoomManagerListener, _SafeStr_1688, _SafeStr_1689, _SafeStr_41, _SafeStr_1690 
    {

        public static const SETUP_WITHOUT_TOOLBAR:uint = 1;
        public static const _SafeStr_8304:uint = 2;
        public static const SETUP_WITHOUT_GAME_MANAGER:uint = 4;
        public static const _SafeStr_8305:uint = 5;
        private static const ROOM_TEMP_ID:String = "temporary_room";
        public static const OBJECT_ID_ROOM:int = -1;
        private static const OBJECT_TYPE_ROOM:String = "room";
        private static const OBJECT_ID_ROOM_HIGHLIGHTER:int = -2;
        private static const OBJECT_TYPE_ROOM_HIGHLIGHTER:String = "tile_cursor";
        private static const _SafeStr_8895:int = -3;
        private static const _SafeStr_8896:String = "selection_arrow";
        private static const _SafeStr_8897:String = "overlay";
        private static const _SafeStr_8898:String = "object_icon_sprite";
        private static const ROOM_DRAG_THRESHOLD:int = 15;
        private static const _SafeStr_8899:int = 40;

        private var _communication:_SafeStr_25 = null;
        private var _roomRendererFactory:IRoomRendererFactory = null;
        private var _roomManager:IRoomManager = null;
        private var _roomObjectFactory:IRoomObjectFactory = null;
        private var _visualizationFactory:IRoomObjectVisualizationFactory = null;
        private var _adManager:_SafeStr_1705 = null;
        private var _sessionDataManager:ISessionDataManager = null;
        private var _roomSessionManager:IRoomSessionManager = null;
        private var _toolbar:IHabboToolbar = null;
        private var _catalog:IHabboCatalog = null;
        private var _windowManager:_SafeStr_1695;
        private var _SafeStr_3700:_SafeStr_3180 = null;
        private var _SafeStr_3702:_SafeStr_3127 = null;
        private var _SafeStr_3701:_SafeStr_3143 = null;
        private var _SafeStr_8900:Boolean = false;
        private var _SafeStr_3703:NumberBank;
        private var _SafeStr_3705:_SafeStr_24;
        private var _SafeStr_3704:NumberBank;
        private var _SafeStr_3706:_SafeStr_24;
        private var _SafeStr_3698:Boolean = false;
        protected var _SafeStr_3699:int = 0;
        private var _SafeStr_3714:int = -1;
        private var _SafeStr_3715:int = 0;
        private var _SafeStr_3716:int = 0;
        private var _SafeStr_3711:Boolean = false;
        private var _SafeStr_3717:Boolean = false;
        private var _SafeStr_3719:int = 0;
        private var _SafeStr_3720:int = 0;
        private var _SafeStr_3712:int = 0;
        private var _SafeStr_3713:int = 0;
        private var _roomDraggingAlwaysCenters:Boolean = false;
        private var _SafeStr_3707:_SafeStr_24 = null;
        private var _SafeStr_3708:_SafeStr_24 = null;
        private var _skipFurnitureCreationForNextFrame:Boolean = false;
        private var _mouseCursorUpdate:Boolean;
        private var _SafeStr_3709:_SafeStr_24 = null;
        private var _gameManager:_SafeStr_1699;
        private var _SafeStr_3710:Boolean;
        private var _SafeStr_3721:int = -1;
        private var _SafeStr_3696:int = 0;
        private var _SafeStr_3697:int = 0;
        private var _SafeStr_8901:int = 0;
        private var _SafeStr_3718:int = 0;

        public function _SafeStr_1691(_arg_1:_SafeStr_31, _arg_2:uint=0)
        {
            super(_arg_1, _arg_2);
        }

        public function get mouseEventsDisabledAboveY():int
        {
            return (_SafeStr_3696);
        }

        public function set mouseEventsDisabledAboveY(_arg_1:int):void
        {
            _SafeStr_3696 = _arg_1;
        }

        public function get mouseEventsDisabledLeftToX():int
        {
            return (_SafeStr_3697);
        }

        public function set mouseEventsDisabledLeftToX(_arg_1:int):void
        {
            _SafeStr_3697 = _arg_1;
        }

        public function get isInitialized():Boolean
        {
            return (_SafeStr_3698);
        }

        public function get connection():IConnection
        {
            return (_communication.connection);
        }

        public function get activeRoomId():int
        {
            return (_SafeStr_3699);
        }

        public function get roomManager():IRoomManager
        {
            return (_roomManager);
        }

        public function get configuration():_SafeStr_19
        {
            return (this);
        }

        protected function get eventHandler():_SafeStr_3180
        {
            return (_SafeStr_3700);
        }

        private function get useOffsetScrolling():Boolean
        {
            return (true);
        }

        public function get gameEngine():_SafeStr_1699
        {
            return (_gameManager);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDRoomObjectFactory(), function (_arg_1:IRoomObjectFactory):void
            {
                _roomObjectFactory = _arg_1;
            }), new ComponentDependency(new IIDRoomObjectVisualizationFactory(), function (_arg_1:IRoomObjectVisualizationFactory):void
            {
                _visualizationFactory = _arg_1;
            }), new ComponentDependency(new IIDRoomManager(), function (_arg_1:IRoomManager):void
            {
                _roomManager = _arg_1;
            }), new ComponentDependency(new IIDRoomRendererFactory(), function (_arg_1:IRoomRendererFactory):void
            {
                _roomRendererFactory = _arg_1;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communication = _arg_1;
            }, ((flags & 0x05) == 0)), new ComponentDependency(new IIDHabboConfigurationManager(), null, true, [{
                "type":"complete",
                "callback":onConfigurationComplete
            }]), new ComponentDependency(new IIDHabboAdManager(), function (_arg_1:_SafeStr_1705):void
            {
                _adManager = _arg_1;
            }, false, [{
                "type":"AE_ROOM_AD_SHOW",
                "callback":showRoomAd
            }, {
                "type":"AE_ROOM_AD_IMAGE_LOADED",
                "callback":onRoomAdImageLoaded
            }, {
                "type":"AE_ROOM_AD_IMAGE_LOADING_FAILED",
                "callback":onRoomAdImageLoaded
            }]), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (_arg_1:IRoomSessionManager):void
            {
                _roomSessionManager = _arg_1;
            }, false, [{
                "type":"RSE_STARTED",
                "callback":onRoomSessionEvent
            }, {
                "type":"RSE_ENDED",
                "callback":onRoomSessionEvent
            }]), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            }, false, [{
                "type":"HTE_TOOLBAR_CLICK",
                "callback":onToolbarClicked
            }]), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }, false), new ComponentDependency(new IIDHabboGameManager(), function (_arg_1:_SafeStr_1699):void
            {
                _gameManager = _arg_1;
            }, ((flags & 0x04) == 0)), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _SafeStr_3708 = new _SafeStr_24();
            _SafeStr_3703 = new NumberBank(1000);
            _SafeStr_3704 = new NumberBank(1000);
            _SafeStr_3705 = new _SafeStr_24();
            _SafeStr_3706 = new _SafeStr_24();
            _SafeStr_3707 = new _SafeStr_24();
            _SafeStr_3700 = createRoomObjectEventHandlerInstance();
            _SafeStr_3702 = new _SafeStr_3127(this);
            registerUpdateReceiver(this, 1);
            _roomObjectFactory.addObjectEventListener(roomObjectEventHandler);
        }

        private function onConfigurationComplete(_arg_1:Event):void
        {
            if (_SafeStr_3701)
            {
                _SafeStr_3701.dispose();
                events.removeEventListener("RCL_LOADER_READY", onContentLoaderReady);
            };
            var _local_2:DisplayObjectContainer = context.displayObjectContainer;
            var _local_3:LoaderInfo = _local_2.loaderInfo;
            _SafeStr_3701 = new _SafeStr_3143(_local_3.loaderURL);
            _SafeStr_3701.initialize(events, this);
            _SafeStr_3701.iconAssets = assets;
            _SafeStr_3701.iconListener = this;
            _SafeStr_3701.visualizationFactory = _visualizationFactory;
            _roomManager.addObjectUpdateCategory(10);
            _roomManager.addObjectUpdateCategory(20);
            _roomManager.addObjectUpdateCategory(100);
            _roomManager.addObjectUpdateCategory(200);
            _roomManager.addObjectUpdateCategory(0);
            _roomManager.setContentLoader(_SafeStr_3701);
            if (((_SafeStr_3702) && (_communication)))
            {
                _SafeStr_3702.connection = _communication.connection;
            };
            _roomDraggingAlwaysCenters = getBoolean("room.dragging.always_center");
            _SafeStr_3701.sessionDataManager = _sessionDataManager;
            events.addEventListener("RCL_LOADER_READY", onContentLoaderReady);
        }

        protected function createRoomObjectEventHandlerInstance():_SafeStr_3180
        {
            return (new _SafeStr_3180(this));
        }

        override public function dispose():void
        {
            var _local_2:int;
            var _local_1:* = null;
            if (disposed)
            {
                return;
            };
            removeUpdateReceiver(this);
            if (_SafeStr_3703 != null)
            {
                _SafeStr_3703.dispose();
                _SafeStr_3703 = null;
            };
            if (_SafeStr_3704 != null)
            {
                _SafeStr_3704.dispose();
                _SafeStr_3704 = null;
            };
            if (_SafeStr_3705 != null)
            {
                _SafeStr_3705.dispose();
            };
            if (_SafeStr_3706 != null)
            {
                _SafeStr_3706.dispose();
            };
            if (_SafeStr_3700 != null)
            {
                _SafeStr_3700.dispose();
                _SafeStr_3700 = null;
            };
            if (_SafeStr_3702 != null)
            {
                _SafeStr_3702.dispose();
                _SafeStr_3702 = null;
            };
            if (_SafeStr_3701 != null)
            {
                _SafeStr_3701.dispose();
                _SafeStr_3701 = null;
            };
            if (_SafeStr_3707 != null)
            {
                _SafeStr_3707.dispose();
                _SafeStr_3707 = null;
            };
            if (_SafeStr_3708 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_3708.length)
                {
                    _local_1 = (_SafeStr_3708.getWithIndex(_local_2) as _SafeStr_3110);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _SafeStr_3708.dispose();
                _SafeStr_3708 = null;
            };
            if (_SafeStr_3709 != null)
            {
                _SafeStr_3709.dispose();
                _SafeStr_3709 = null;
            };
            super.dispose();
        }

        public function set disableUpdate(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                removeUpdateReceiver(this);
            }
            else
            {
                removeUpdateReceiver(this);
                registerUpdateReceiver(this, 1);
            };
        }

        public function runUpdate():void
        {
            update(1);
        }

        private function getRoomInstanceData(_arg_1:int):_SafeStr_3110
        {
            var _local_2:String = getRoomIdentifier(_arg_1);
            var _local_3:_SafeStr_3110;
            if (_SafeStr_3708 != null)
            {
                _local_3 = (_SafeStr_3708.getValue(_local_2) as _SafeStr_3110);
                if (_local_3 == null)
                {
                    _local_3 = new _SafeStr_3110(_arg_1);
                    _SafeStr_3708.add(_local_2, _local_3);
                };
            };
            return (_local_3);
        }

        public function setFurniStackingHeightMap(_arg_1:int, _arg_2:_SafeStr_3178):void
        {
            var _local_3:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_3 != null)
            {
                _local_3.furniStackingHeightMap = _arg_2;
            };
        }

        public function getFurniStackingHeightMap(_arg_1:int):_SafeStr_3178
        {
            var _local_2:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.furniStackingHeightMap);
            };
            return (null);
        }

        public function setWorldType(_arg_1:int, _arg_2:String):void
        {
            var _local_3:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_3 != null)
            {
                _local_3.worldType = _arg_2;
            };
        }

        public function getWorldType(_arg_1:int):String
        {
            var _local_2:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.worldType);
            };
            return (null);
        }

        public function getLegacyGeometry(_arg_1:int):_SafeStr_3137
        {
            var _local_2:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.legacyGeometry);
            };
            return (null);
        }

        public function getTileObjectMap(_arg_1:int):_SafeStr_3262
        {
            var _local_2:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.tileObjectMap);
            };
            return (null);
        }

        private function getActiveRoomCamera():_SafeStr_3120
        {
            return (getRoomCamera(_SafeStr_3699));
        }

        private function getRoomCamera(_arg_1:int):_SafeStr_3120
        {
            var _local_2:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.roomCamera);
            };
            return (null);
        }

        public function setSelectedObjectData(_arg_1:int, _arg_2:_SafeStr_3172):void
        {
            var _local_3:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_3 != null)
            {
                _local_3.selectedObject = _arg_2;
                if (_arg_2 != null)
                {
                    _local_3.placedObject = null;
                };
            };
        }

        public function getSelectedObjectData(_arg_1:int):ISelectedRoomObjectData
        {
            var _local_2:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.selectedObject);
            };
            return (null);
        }

        public function setPlacedObjectData(_arg_1:int, _arg_2:_SafeStr_3172):void
        {
            var _local_3:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_3 != null)
            {
                _local_3.placedObject = _arg_2;
            };
        }

        public function getPlacedObjectData(_arg_1:int):ISelectedRoomObjectData
        {
            var _local_2:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.placedObject);
            };
            return (null);
        }

        public function addObjectUpdateCategory(_arg_1:int):void
        {
            _roomManager.addObjectUpdateCategory(_arg_1);
        }

        public function removeObjectUpdateCategory(_arg_1:int):void
        {
            _roomManager.removeObjectUpdateCategory(_arg_1);
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:int;
            var _local_3:* = null;
            RoomEnterEffect.turnVisualizationOn();
            if (_roomManager != null)
            {
                createRoomFurniture();
                _roomManager.update(_arg_1);
                _local_2 = 0;
                while (_local_2 < _roomManager.getRoomCount())
                {
                    _local_3 = _roomManager.getRoomWithIndex(_local_2);
                    if (((!(_local_3 == null)) && (!(_local_3.getRenderer() == null))))
                    {
                        _local_3.getRenderer().update(_arg_1);
                    };
                    _local_2++;
                };
                updateRoomCameras(_arg_1);
                if (_mouseCursorUpdate)
                {
                    updateMouseCursor();
                };
            };
            RoomEnterEffect.turnVisualizationOff();
        }

        private function updateMouseCursor():void
        {
            _mouseCursorUpdate = false;
            var _local_1:_SafeStr_3110 = getRoomInstanceData(_SafeStr_3699);
            if (((_local_1) && (_local_1.hasButtonMouseCursorOwners())))
            {
                Mouse.cursor = "button";
            }
            else
            {
                Mouse.cursor = "auto";
            };
        }

        public function requestMouseCursor(_arg_1:String, _arg_2:int, _arg_3:String):void
        {
            var _local_4:int = getRoomObjectCategory(_arg_3);
            switch (_arg_1)
            {
                case "ROFCAE_MOUSE_BUTTON":
                    if (((isGameMode) && (_local_4 == 100)))
                    {
                        _SafeStr_3721 = _arg_2;
                    };
                    addButtonMouseCursorOwner(_SafeStr_3699, _local_4, _arg_2);
                    return;
                default:
                    if (((isGameMode) && (_local_4 == 100)))
                    {
                        _SafeStr_3721 = -1;
                    };
                    removeButtonMouseCursorOwner(_SafeStr_3699, _local_4, _arg_2);
                    return;
            };
        }

        private function addButtonMouseCursorOwner(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_6:IRoomSession = _roomSessionManager.getSession(_arg_1);
            if ((((!(_arg_2 == 10)) && (!(_arg_2 == 20))) || ((!(_local_6 == null)) && (_local_6.roomControllerLevel >= 1))))
            {
                _local_5 = ((_arg_2 + "_") + _arg_3);
                _local_4 = getRoomInstanceData(_arg_1);
                if (_local_4 != null)
                {
                    if (_local_4.addButtonMouseCursorOwner(_local_5))
                    {
                        _mouseCursorUpdate = true;
                    };
                };
            };
        }

        private function removeButtonMouseCursorOwner(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_5:* = null;
            var _local_4:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_4 != null)
            {
                _local_5 = ((_arg_2 + "_") + _arg_3);
                if (_local_4.removeButtonMouseCursorOwner(_local_5))
                {
                    _mouseCursorUpdate = true;
                };
            };
        }

        public function addFloorHole(_arg_1:int, _arg_2:int):void
        {
            var _local_8:* = null;
            var _local_9:* = null;
            var _local_5:* = null;
            var _local_3:int;
            var _local_4:int;
            var _local_7:int;
            var _local_6:int;
            if (_arg_2 >= 0)
            {
                _local_8 = getObjectRoom(_arg_1);
                _local_9 = getObjectFurniture(_arg_1, _arg_2);
                if (((((!(_local_9 == null)) && (!(_local_9.getModel() == null))) && (!(_local_8 == null))) && (!(_local_8.getEventHandler() == null))))
                {
                    _local_5 = "RORPFHUM_ADD";
                    _local_3 = _local_9.getLocation().x;
                    _local_4 = _local_9.getLocation().y;
                    _local_7 = _local_9.getModel().getNumber("furniture_size_x");
                    _local_6 = _local_9.getModel().getNumber("furniture_size_y");
                    _local_8.getEventHandler().processUpdateMessage(new RoomObjectRoomFloorHoleUpdateMessage(_local_5, _arg_2, _local_3, _local_4, _local_7, _local_6));
                };
            };
        }

        public function removeFloorHole(_arg_1:int, _arg_2:int):void
        {
            var _local_4:* = null;
            var _local_3:* = null;
            if (_arg_2 >= 0)
            {
                _local_4 = getObjectRoom(_arg_1);
                if (((!(_local_4 == null)) && (!(_local_4.getEventHandler() == null))))
                {
                    _local_3 = "RORPFHUM_REMOVE";
                    _local_4.getEventHandler().processUpdateMessage(new RoomObjectRoomFloorHoleUpdateMessage(_local_3, _arg_2));
                };
            };
        }

        private function createRoomFurniture():void
        {
            var _local_6:int;
            _local_6 = 5;
            var _local_1:int;
            var _local_4:int;
            var _local_3:* = null;
            var _local_9:Boolean;
            var _local_7:* = null;
            var _local_8:* = null;
            if (_skipFurnitureCreationForNextFrame)
            {
                _skipFurnitureCreationForNextFrame = false;
                return;
            };
            var _local_5:int = getTimer();
            for each (var _local_2:_SafeStr_3110 in _SafeStr_3708)
            {
                _local_4 = 0;
                _local_3 = null;
                _local_9 = false;
                while ((_local_3 = _local_2.getFurnitureData()) != null)
                {
                    _local_9 = addObjectFurnitureFromData(_local_2.roomId, _local_3.id, _local_3);
                    if ((++_local_4 % 5) == 0)
                    {
                        _local_1 = getTimer();
                        if ((((_local_1 - _local_5) >= 40) && (!(_SafeStr_3710))))
                        {
                            _skipFurnitureCreationForNextFrame = true;
                            break;
                        };
                    };
                };
                while (((!(_skipFurnitureCreationForNextFrame)) && (!((_local_3 = _local_2.getWallItemData()) == null))))
                {
                    _local_9 = addObjectWallItemFromData(_local_2.roomId, _local_3.id, _local_3);
                    if ((++_local_4 % 5) == 0)
                    {
                        _local_1 = getTimer();
                        if ((((_local_1 - _local_5) >= 40) && (!(_SafeStr_3710))))
                        {
                            _skipFurnitureCreationForNextFrame = true;
                            break;
                        };
                    };
                };
                if (((_local_9) && (_SafeStr_3710)))
                {
                    _local_7 = getRoomIdentifier(_local_2.roomId);
                    _local_8 = (_roomManager.getRoom(_local_7) as RoomInstance);
                    if (!_local_8.hasUninitializedObjects())
                    {
                        objectsInitialized(_local_7);
                    };
                };
                if (_skipFurnitureCreationForNextFrame)
                {
                    return;
                };
            };
        }

        private function updateRoomCameras(_arg_1:uint):void
        {
            var _local_8:int;
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_9:int;
            var _local_6:int;
            var _local_4:int;
            var _local_10:* = null;
            var _local_2:int = 1;
            _local_8 = 0;
            while (_local_8 < _SafeStr_3708.length)
            {
                _local_3 = (_SafeStr_3708.getWithIndex(_local_8) as _SafeStr_3110);
                _local_7 = null;
                _local_9 = 0;
                if (_local_3 != null)
                {
                    _local_7 = _local_3.roomCamera;
                    _local_9 = _local_3.roomId;
                };
                if (_local_7 != null)
                {
                    _local_6 = _local_7.targetId;
                    _local_4 = _local_7.targetCategory;
                    _local_10 = getRoomObject(_local_9, _local_6, _local_4);
                    if (_local_10 != null)
                    {
                        if (((!(_local_9 == _SafeStr_3699)) || (!(_SafeStr_3711))))
                        {
                            updateRoomCamera(_local_9, _local_2, _local_10.getLocation(), _arg_1);
                        };
                    };
                };
                _local_8++;
            };
            var _local_5:IRoomRenderingCanvas = getRoomCanvas(_SafeStr_3699, _local_2);
            if (_local_5 != null)
            {
                if (_SafeStr_3711)
                {
                    _local_5.screenOffsetX = (_local_5.screenOffsetX + _SafeStr_3712);
                    _local_5.screenOffsetY = (_local_5.screenOffsetY + _SafeStr_3713);
                    _SafeStr_3712 = 0;
                    _SafeStr_3713 = 0;
                };
            };
        }

        private function updateRoomCamera(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:uint):void
        {
            var _local_46:Number;
            var _local_18:* = null;
            var _local_26:int;
            var _local_25:int;
            var _local_41:* = null;
            var _local_6:* = null;
            var _local_31:Number;
            var _local_32:Number;
            var _local_9:Number;
            var _local_27:Number;
            var _local_22:Number;
            var _local_21:Number;
            var _local_19:Number;
            var _local_34:* = null;
            var _local_17:Number;
            var _local_20:Number;
            var _local_12:* = null;
            var _local_36:Number;
            var _local_38:Number;
            var _local_42:Number;
            var _local_40:Number;
            var _local_10:Number;
            var _local_8:Number;
            var _local_5:* = null;
            var _local_44:Boolean;
            var _local_43:Boolean;
            var _local_24:Boolean;
            var _local_23:Boolean;
            var _local_14:Number;
            var _local_13:Number;
            var _local_33:Number;
            var _local_37:Number;
            var _local_28:Number;
            var _local_15:int;
            var _local_16:int;
            var _local_39:* = null;
            var _local_29:* = null;
            var _local_30:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            var _local_7:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if ((((_local_30 == null) || (_local_7 == null)) || (!(_local_30.scale == 1))))
            {
                return;
            };
            var _local_45:RoomGeometry = (_local_30.geometry as RoomGeometry);
            var _local_11:_SafeStr_3120 = _local_7.roomCamera;
            var _local_35:IRoomInstance = getRoom(_arg_1);
            if ((((!(_local_45 == null)) && (!(_local_11 == null))) && (!(_local_35 == null))))
            {
                _local_46 = (Math.floor(_arg_3.z) + 1);
                _local_18 = getRoomCanvasRectangle(_arg_1, _arg_2);
                if (_local_18 != null)
                {
                    _local_26 = Math.round(_local_18.width);
                    _local_25 = Math.round(_local_18.height);
                    _local_41 = getActiveRoomBoundingRectangle(_arg_2);
                    if (((!(_local_41 == null)) && ((((_local_41.right < 0) || (_local_41.bottom < 0)) || (_local_41.left >= _local_26)) || (_local_41.top >= _local_25))))
                    {
                        _local_11.reset();
                    };
                    if (((((((!(_local_11.screenWd == _local_26)) || (!(_local_11.screenHt == _local_25))) || (!(_local_11.scale == _local_45.scale))) || (!(_local_11.geometryUpdateId == _local_45.updateId))) || (!(Vector3d.isEqual(_arg_3, _local_11.targetObjectLoc)))) || (_local_11.isMoving)))
                    {
                        _local_11.targetObjectLoc = _arg_3;
                        _local_6 = new Vector3d();
                        _local_6.assign(_arg_3);
                        _local_6.x = Math.round(_local_6.x);
                        _local_6.y = Math.round(_local_6.y);
                        _local_31 = (_local_35.getNumber("room_min_x") - 0.5);
                        _local_32 = (_local_35.getNumber("room_min_y") - 0.5);
                        _local_9 = (_local_35.getNumber("room_max_x") + 0.5);
                        _local_27 = (_local_35.getNumber("room_max_y") + 0.5);
                        _local_22 = Math.round(((_local_31 + _local_9) / 2));
                        _local_21 = Math.round(((_local_32 + _local_27) / 2));
                        _local_19 = 2;
                        _local_34 = new Point((_local_6.x - _local_22), (_local_6.y - _local_21));
                        _local_17 = (_local_45.scale / Math.sqrt(2));
                        _local_20 = (_local_17 / 2);
                        _local_12 = new Matrix();
                        _local_12.rotate(((-(_local_45.direction.x + 90) / 180) * 3.14159265358979));
                        _local_34 = _local_12.transformPoint(_local_34);
                        _local_34.y = (_local_34.y * (_local_20 / _local_17));
                        _local_36 = (((_local_18.width / 2) / _local_17) - 1);
                        _local_38 = (((_local_18.height / 2) / _local_20) - 1);
                        _local_42 = 0;
                        _local_40 = 0;
                        _local_10 = 0;
                        _local_8 = 0;
                        _local_5 = _local_45.getScreenPoint(new Vector3d(_local_22, _local_21, _local_19));
                        if (!_local_5)
                        {
                            return;
                        };
                        _local_5.x = (_local_5.x + Math.round((_local_18.width / 2)));
                        _local_5.y = (_local_5.y + Math.round((_local_18.height / 2)));
                        if (_local_41 != null)
                        {
                            _local_41.offset(-(_local_30.screenOffsetX), -(_local_30.screenOffsetY));
                            if (((_local_41.width > 1) && (_local_41.height > 1)))
                            {
                                _local_42 = (((_local_41.left - _local_5.x) - (_local_45.scale * 0.25)) / _local_17);
                                _local_10 = (((_local_41.right - _local_5.x) + (_local_45.scale * 0.25)) / _local_17);
                                _local_40 = (((_local_41.top - _local_5.y) - (_local_45.scale * 0.5)) / _local_20);
                                _local_8 = (((_local_41.bottom - _local_5.y) + (_local_45.scale * 0.5)) / _local_20);
                            }
                            else
                            {
                                _local_45.adjustLocation(new Vector3d(-30, -30), 25);
                                return;
                            };
                        }
                        else
                        {
                            _local_45.adjustLocation(new Vector3d(0, 0), 25);
                            return;
                        };
                        _local_44 = false;
                        _local_43 = false;
                        _local_24 = false;
                        _local_23 = false;
                        _local_14 = Math.round(((_local_10 - _local_42) * _local_17));
                        if (_local_14 < _local_18.width)
                        {
                            _local_46 = 2;
                            _local_34.x = ((_local_10 + _local_42) / 2);
                            _local_24 = true;
                        }
                        else
                        {
                            if (_local_34.x > (_local_10 - _local_36))
                            {
                                _local_34.x = (_local_10 - _local_36);
                                _local_44 = true;
                            };
                            if (_local_34.x < (_local_42 + _local_36))
                            {
                                _local_34.x = (_local_42 + _local_36);
                                _local_44 = true;
                            };
                        };
                        _local_13 = Math.round(((_local_8 - _local_40) * _local_20));
                        if (_local_13 < _local_18.height)
                        {
                            _local_46 = 2;
                            _local_34.y = ((_local_8 + _local_40) / 2);
                            _local_23 = true;
                        }
                        else
                        {
                            if (_local_34.y > (_local_8 - _local_38))
                            {
                                _local_34.y = (_local_8 - _local_38);
                                _local_43 = true;
                            };
                            if (_local_34.y < (_local_40 + _local_38))
                            {
                                _local_34.y = (_local_40 + _local_38);
                                _local_43 = true;
                            };
                            if (_local_43)
                            {
                                _local_34.y = (_local_34.y / (_local_20 / _local_17));
                            };
                        };
                        _local_12.invert();
                        _local_34 = _local_12.transformPoint(_local_34);
                        _local_34.x = (_local_34.x + _local_22);
                        _local_34.y = (_local_34.y + _local_21);
                        _local_33 = 0.35;
                        _local_37 = 0.2;
                        _local_28 = 0.2;
                        _local_15 = 10;
                        _local_16 = 10;
                        if ((_local_28 * _local_26) > 100)
                        {
                            _local_28 = (100 / _local_26);
                        };
                        if ((_local_33 * _local_25) > 150)
                        {
                            _local_33 = (150 / _local_25);
                        };
                        if ((_local_37 * _local_25) > 150)
                        {
                            _local_37 = (150 / _local_25);
                        };
                        if ((((_local_11.limitedLocationX) && (_local_11.screenWd == _local_26)) && (_local_11.screenHt == _local_25)))
                        {
                            _local_28 = 0;
                        };
                        if ((((_local_11.limitedLocationY) && (_local_11.screenWd == _local_26)) && (_local_11.screenHt == _local_25)))
                        {
                            _local_33 = 0;
                            _local_37 = 0;
                        };
                        _local_18.right = (_local_18.right * (1 - (_local_28 * 2)));
                        _local_18.bottom = (_local_18.bottom * (1 - (_local_33 + _local_37)));
                        if (_local_18.right < _local_15)
                        {
                            _local_18.right = _local_15;
                        };
                        if (_local_18.bottom < _local_16)
                        {
                            _local_18.bottom = _local_16;
                        };
                        if ((_local_33 + _local_37) > 0)
                        {
                            _local_18.offset((-(_local_18.width) / 2), (-(_local_18.height) * (_local_37 / (_local_33 + _local_37))));
                        }
                        else
                        {
                            _local_18.offset((-(_local_18.width) / 2), (-(_local_18.height) / 2));
                        };
                        _local_5 = _local_45.getScreenPoint(_local_6);
                        if (!_local_5)
                        {
                            return;
                        };
                        if (_local_5 != null)
                        {
                            _local_5.x = (_local_5.x + _local_30.screenOffsetX);
                            _local_5.y = (_local_5.y + _local_30.screenOffsetY);
                            _local_6.z = _local_46;
                            _local_6.x = (Math.round((_local_34.x * 2)) / 2);
                            _local_6.y = (Math.round((_local_34.y * 2)) / 2);
                            if (_local_11.location == null)
                            {
                                _local_45.location = _local_6;
                                if (useOffsetScrolling)
                                {
                                    _local_11.initializeLocation(new Vector3d(0, 0, 0));
                                }
                                else
                                {
                                    _local_11.initializeLocation(_local_6);
                                };
                            };
                            _local_39 = _local_45.getScreenPoint(_local_6);
                            _local_29 = new Vector3d(0, 0, 0);
                            if (_local_39 != null)
                            {
                                _local_29.x = _local_39.x;
                                _local_29.y = _local_39.y;
                            };
                            if (((((((((_local_5.x < _local_18.left) || (_local_5.x > _local_18.right)) && (!(_local_11.centeredLocX))) || (((_local_5.y < _local_18.top) || (_local_5.y > _local_18.bottom)) && (!(_local_11.centeredLocY)))) || (((_local_24) && (!(_local_11.centeredLocX))) && (!(_local_11.screenWd == _local_26)))) || (((_local_23) && (!(_local_11.centeredLocY))) && (!(_local_11.screenHt == _local_25)))) || ((!(_local_11.roomWd == _local_41.width)) || (!(_local_11.roomHt == _local_41.height)))) || ((!(_local_11.screenWd == _local_26)) || (!(_local_11.screenHt == _local_25)))))
                            {
                                _local_11.limitedLocationX = _local_44;
                                _local_11.limitedLocationY = _local_43;
                                if (useOffsetScrolling)
                                {
                                    _local_11.target = _local_29;
                                }
                                else
                                {
                                    _local_11.target = _local_6;
                                };
                            }
                            else
                            {
                                if (!_local_44)
                                {
                                    _local_11.limitedLocationX = false;
                                };
                                if (!_local_43)
                                {
                                    _local_11.limitedLocationY = false;
                                };
                            };
                        };
                        _local_11.centeredLocX = _local_24;
                        _local_11.centeredLocY = _local_23;
                        _local_11.screenWd = _local_26;
                        _local_11.screenHt = _local_25;
                        _local_11.scale = _local_45.scale;
                        _local_11.geometryUpdateId = _local_45.updateId;
                        _local_11.roomWd = _local_41.width;
                        _local_11.roomHt = _local_41.height;
                        if (!_sessionDataManager.isRoomCameraFollowDisabled)
                        {
                            if (useOffsetScrolling)
                            {
                                _local_11.update(_arg_4, 8);
                            }
                            else
                            {
                                _local_11.update(_arg_4, 0.5);
                            };
                        };
                        if (useOffsetScrolling)
                        {
                            _local_30.screenOffsetX = -(_local_11.location.x);
                            _local_30.screenOffsetY = -(_local_11.location.y);
                        }
                        else
                        {
                            _local_45.adjustLocation(_local_11.location, 25);
                        };
                    }
                    else
                    {
                        _local_11.limitedLocationX = false;
                        _local_11.limitedLocationY = false;
                        _local_11.centeredLocX = false;
                        _local_11.centeredLocY = false;
                    };
                };
            };
        }

        private function onContentLoaderReady(_arg_1:Event):void
        {
            _SafeStr_8900 = true;
            _roomManager.initialize(<nothing/>
            , this);
        }

        private function onRoomSessionEvent(_arg_1:RoomSessionEvent):void
        {
            switch (_arg_1.type)
            {
                case "RSE_STARTED":
                    if (_SafeStr_3702)
                    {
                        _SafeStr_3702.setCurrentRoom(_arg_1.session.roomId);
                    };
                    return;
                case "RSE_ENDED":
                    if (_SafeStr_3702)
                    {
                        _SafeStr_3702.resetCurrentRoom();
                        disposeRoom(_arg_1.session.roomId);
                    };
                    return;
            };
        }

        private function onToolbarClicked(_arg_1:HabboToolbarEvent):void
        {
            var _local_2:* = null;
            if (_arg_1.iconId == "HTIE_ICON_MEMENU")
            {
                _local_2 = getActiveRoomCamera();
                if (_local_2)
                {
                    _local_2.activateFollowing(cameraFollowDuration);
                    _local_2.reset();
                };
            };
        }

        public function roomManagerInitialized(_arg_1:Boolean):void
        {
            var _local_3:int;
            var _local_2:* = null;
            if (_arg_1)
            {
                _SafeStr_3698 = true;
                events.dispatchEvent(new RoomEngineEvent("REE_ENGINE_INITIALIZED", 0));
                _local_3 = 0;
                while (_local_3 < _SafeStr_3707.length)
                {
                    _local_2 = (_SafeStr_3707.getWithIndex(_local_3) as _SafeStr_1662);
                    if (_local_2 != null)
                    {
                        initializeRoom(_local_2.roomId, _local_2.data);
                    };
                    _local_3++;
                };
            }
            else
            {
                _SafeStr_14.log("[RoomEngine] Failed to initialize manager");
            };
        }

        public function setActiveRoom(_arg_1:int):void
        {
            _SafeStr_3699 = _arg_1;
        }

        public function getRoomIdentifier(_arg_1:int):String
        {
            return (String(_arg_1));
        }

        private function getRoomId(_arg_1:String):int
        {
            var _local_2:* = null;
            if (_arg_1 != null)
            {
                _local_2 = _arg_1.split("_");
                if (_local_2.length > 0)
                {
                    return (_local_2[0]);
                };
            };
            return (-1);
        }

        public function getRoomNumberValue(_arg_1:int, _arg_2:String):Number
        {
            var _local_3:IRoomInstance = getRoom(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3.getNumber(_arg_2));
            };
            return (NaN);
        }

        public function getRoomStringValue(_arg_1:int, _arg_2:String):String
        {
            var _local_3:IRoomInstance = getRoom(_arg_1);
            if (_local_3 != null)
            {
                return (_local_3.getString(_arg_2));
            };
            return (null);
        }

        public function setIsPlayingGame(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_3:int;
            var _local_4:IRoomInstance = getRoom(_arg_1);
            if (_local_4 != null)
            {
                _local_3 = ((_arg_2) ? 1 : 0);
                _local_4.setNumber("is_playing_game", _local_3);
                if (_local_3 == 0)
                {
                    events.dispatchEvent(new RoomEngineEvent("REE_NORMAL_MODE", _arg_1));
                }
                else
                {
                    events.dispatchEvent(new RoomEngineEvent("REE_GAME_MODE", _arg_1));
                };
            };
        }

        public function getIsPlayingGame(_arg_1:int):Boolean
        {
            var _local_2:Number;
            var _local_3:IRoomInstance = getRoom(_arg_1);
            if (_local_3 != null)
            {
                _local_2 = _local_3.getNumber("is_playing_game");
                if (_local_2 > 0)
                {
                    return (true);
                };
            };
            return (false);
        }

        public function getActiveRoomIsPlayingGame():Boolean
        {
            return (getIsPlayingGame(_SafeStr_3699));
        }

        public function getRoom(_arg_1:int):IRoomInstance
        {
            if (!_SafeStr_3698)
            {
                return (null);
            };
            var _local_2:String = getRoomIdentifier(_arg_1);
            return (_roomManager.getRoom(_local_2));
        }

        public function initializeRoom(_arg_1:int, _arg_2:XML):void
        {
            var _local_3:String = getRoomIdentifier(_arg_1);
            var _local_5:_SafeStr_1662;
            var _local_6:String = "111";
            var _local_7:String = "201";
            var _local_4:String = "1";
            if (!_SafeStr_3698)
            {
                _local_5 = _SafeStr_3707.remove(_local_3);
                if (_local_5 != null)
                {
                    _local_6 = _local_5.floorType;
                    _local_7 = _local_5.wallType;
                    _local_4 = _local_5.landscapeType;
                };
                _local_5 = new _SafeStr_1662(_arg_1, _arg_2);
                _local_5.floorType = _local_6;
                _local_5.wallType = _local_7;
                _local_5.landscapeType = _local_4;
                _SafeStr_3707.add(_local_3, _local_5);
                _SafeStr_14.log("Room Engine not initilized yet, can not create room. Room data stored for later initialization.");
                return;
            };
            if (_arg_2 == null)
            {
                _SafeStr_14.log("Room property messages received before floor height map, will initialize when floor height map received.");
                return;
            };
            _local_5 = _SafeStr_3707.remove(_local_3);
            if (_local_5 != null)
            {
                if (((!(_local_5.floorType == null)) && (_local_5.floorType.length > 0)))
                {
                    _local_6 = _local_5.floorType;
                };
                if (((!(_local_5.wallType == null)) && (_local_5.wallType.length > 0)))
                {
                    _local_7 = _local_5.wallType;
                };
                if (((!(_local_5.landscapeType == null)) && (_local_5.landscapeType.length > 0)))
                {
                    _local_4 = _local_5.landscapeType;
                };
            };
            var _local_8:IRoomInstance = createRoom(_local_3, _arg_2, _local_6, _local_7, _local_4, getWorldType(_arg_1));
            if (_local_8 == null)
            {
                return;
            };
            events.dispatchEvent(new RoomEngineEvent("REE_INITIALIZED", _arg_1));
        }

        private function createRoom(_arg_1:String, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String):IRoomInstance
        {
            var _local_24:int;
            var _local_11:* = null;
            var _local_26:Number;
            var _local_9:Number;
            var _local_25:Number;
            var _local_8:Number;
            var _local_22:* = null;
            var _local_17:* = null;
            var _local_27:* = null;
            var _local_10:* = null;
            var _local_20:int;
            var _local_7:* = null;
            var _local_16:Number;
            var _local_14:Number;
            var _local_13:Number;
            var _local_12:Number;
            var _local_18:* = null;
            var _local_21:* = null;
            var _local_19:* = null;
            if (!_SafeStr_3698)
            {
                return (null);
            };
            var _local_23:IRoomInstance = _roomManager.createRoom(_arg_1, _arg_2);
            if (_local_23 == null)
            {
                return (null);
            };
            var _local_28:int;
            var _local_29:IRoomObjectController;
            var _local_15:* = 1;
            _local_29 = (_local_23.createRoomObject(-1, "room", _local_28) as IRoomObjectController);
            _local_23.setNumber("room_is_public", 0, true);
            _local_23.setNumber("room_z_scale", _local_15, true);
            if (_arg_2 != null)
            {
                _local_24 = 0;
                if (_arg_2.dimensions.length() == 1)
                {
                    _local_11 = _arg_2.dimensions[0];
                    _local_26 = Number(_local_11.@minX);
                    _local_9 = Number(_local_11.@maxX);
                    _local_25 = Number(_local_11.@minY);
                    _local_8 = Number(_local_11.@maxY);
                    _local_23.setNumber("room_min_x", _local_26);
                    _local_23.setNumber("room_max_x", _local_9);
                    _local_23.setNumber("room_min_y", _local_25);
                    _local_23.setNumber("room_max_y", _local_8);
                    _local_24 = (_local_24 + ((((_local_26 * 423) + (_local_9 * 671)) + (_local_25 * 913)) + (_local_8 * 7509)));
                    if (((!(_local_29 == null)) && (!(_local_29.getModelController() == null))))
                    {
                        _local_29.getModelController().setNumber("room_random_seed", _local_24, true);
                    };
                };
            };
            if (((!(_local_29 == null)) && (!(_local_29.getEventHandler() == null))))
            {
                _local_29.getEventHandler().initialize(_arg_2);
                _local_22 = null;
                if (_arg_3 != null)
                {
                    _local_22 = new RoomObjectRoomUpdateMessage("RORUM_ROOM_FLOOR_UPDATE", _arg_3);
                    _local_29.getEventHandler().processUpdateMessage(_local_22);
                    _local_23.setString("room_floor_type", _arg_3);
                };
                if (_arg_4 != null)
                {
                    _local_22 = new RoomObjectRoomUpdateMessage("RORUM_ROOM_WALL_UPDATE", _arg_4);
                    _local_29.getEventHandler().processUpdateMessage(_local_22);
                    _local_23.setString("room_wall_type", _arg_4);
                };
                if (_arg_5 != null)
                {
                    _local_22 = new RoomObjectRoomUpdateMessage("RORUM_ROOM_LANDSCAPE_UPDATE", _arg_5);
                    _local_29.getEventHandler().processUpdateMessage(_local_22);
                    _local_23.setString("room_landscape_type", _arg_5);
                };
                if (_arg_2 != null)
                {
                    if (_arg_2.doors.door.length() > 0)
                    {
                        _local_17 = _arg_2.doors.door;
                        _local_27 = ["x", "y", "z", "dir"];
                        _local_10 = null;
                        _local_20 = 0;
                        while (_local_20 < _local_17.length())
                        {
                            _local_7 = _local_17[_local_20];
                            if (_SafeStr_1675.checkRequiredAttributes(_local_7, _local_27))
                            {
                                _local_16 = Number(_local_7.@x);
                                _local_14 = Number(_local_7.@y);
                                _local_13 = Number(_local_7.@z);
                                _local_12 = Number(_local_7.@dir);
                                _local_18 = "door";
                                _local_21 = ("door_" + _local_20);
                                _local_19 = new Vector3d(_local_16, _local_14, _local_13);
                                _local_10 = new RoomObjectRoomMaskUpdateMessage("RORMUM_ADD_MASK", _local_21, _local_18, _local_19, "hole");
                                _local_29.getEventHandler().processUpdateMessage(_local_10);
                                if (((_local_12 == 90) || (_local_12 == 180)))
                                {
                                    if (_local_12 == 90)
                                    {
                                        _local_23.setNumber("room_door_x", (_local_16 - 0.5), true);
                                        _local_23.setNumber("room_door_y", _local_14, true);
                                    };
                                    if (_local_12 == 180)
                                    {
                                        _local_23.setNumber("room_door_x", _local_16, true);
                                        _local_23.setNumber("room_door_y", (_local_14 - 0.5), true);
                                    };
                                    _local_23.setNumber("room_door_z", _local_13, true);
                                    _local_23.setNumber("room_door_dir", _local_12, true);
                                };
                            };
                            _local_20++;
                        };
                    };
                };
            };
            _local_23.createRoomObject(-2, "tile_cursor", 200);
            if (!getBoolean("avatar.widget.enabled"))
            {
                _local_23.createRoomObject(-3, "selection_arrow", 200);
            };
            return (_local_23);
        }

        public function getObjectRoom(_arg_1:int):IRoomObjectController
        {
            return (getObject(getRoomIdentifier(_arg_1), -1, 0));
        }

        public function updateObjectRoom(_arg_1:int, _arg_2:String=null, _arg_3:String=null, _arg_4:String=null, _arg_5:Boolean=false):Boolean
        {
            var _local_6:* = null;
            var _local_8:* = null;
            var _local_10:IRoomObjectController = getObjectRoom(_arg_1);
            var _local_7:IRoomInstance = getRoom(_arg_1);
            if (_local_10 == null)
            {
                _local_6 = getRoomIdentifier(_arg_1);
                _local_8 = _SafeStr_3707.getValue(_local_6);
                if (_local_8 == null)
                {
                    _local_8 = new _SafeStr_1662(_arg_1, null);
                    _SafeStr_3707.add(_local_6, _local_8);
                };
                if (_arg_2 != null)
                {
                    _local_8.floorType = _arg_2;
                };
                if (_arg_3 != null)
                {
                    _local_8.wallType = _arg_3;
                };
                if (_arg_4 != null)
                {
                    _local_8.landscapeType = _arg_4;
                };
                return (true);
            };
            if (_local_10.getEventHandler() == null)
            {
                return (false);
            };
            var _local_9:RoomObjectRoomUpdateMessage;
            if (_arg_2 != null)
            {
                if (((!(_local_7 == null)) && (!(_arg_5))))
                {
                    _local_7.setString("room_floor_type", _arg_2);
                };
                _local_9 = new RoomObjectRoomUpdateMessage("RORUM_ROOM_FLOOR_UPDATE", _arg_2);
                _local_10.getEventHandler().processUpdateMessage(_local_9);
            };
            if (_arg_3 != null)
            {
                if (((!(_local_7 == null)) && (!(_arg_5))))
                {
                    _local_7.setString("room_wall_type", _arg_3);
                };
                _local_9 = new RoomObjectRoomUpdateMessage("RORUM_ROOM_WALL_UPDATE", _arg_3);
                _local_10.getEventHandler().processUpdateMessage(_local_9);
            };
            if (_arg_4 != null)
            {
                if (((!(_local_7 == null)) && (!(_arg_5))))
                {
                    _local_7.setString("room_landscape_type", _arg_4);
                };
                _local_9 = new RoomObjectRoomUpdateMessage("RORUM_ROOM_LANDSCAPE_UPDATE", _arg_4);
                _local_10.getEventHandler().processUpdateMessage(_local_9);
            };
            return (true);
        }

        public function updateObjectRoomColor(_arg_1:int, _arg_2:uint, _arg_3:int, _arg_4:Boolean):Boolean
        {
            var _local_6:IRoomObjectController = getObjectRoom(_arg_1);
            if (((_local_6 == null) || (_local_6.getEventHandler() == null)))
            {
                return (false);
            };
            var _local_5:RoomObjectRoomColorUpdateMessage;
            _local_5 = new RoomObjectRoomColorUpdateMessage("RORCUM_BACKGROUND_COLOR", _arg_2, _arg_3, _arg_4);
            _local_6.getEventHandler().processUpdateMessage(_local_5);
            events.dispatchEvent(new RoomEngineRoomColorEvent(_arg_1, _arg_2, _arg_3, _arg_4));
            return (true);
        }

        public function updateObjectRoomBackgroundColor(_arg_1:int, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            var _local_6:IRoomObjectController = getObjectRoom(_arg_1);
            if (((_local_6 == null) || (_local_6.getEventHandler() == null)))
            {
                return (false);
            };
            events.dispatchEvent(new RoomEngineHSLColorEnableEvent("ROHSLCEE_ROOM_BACKGROUND_COLOR", _arg_1, _arg_2, _arg_3, _arg_4, _arg_5));
            return (true);
        }

        public function updateObjectRoomVisibilities(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean=true):Boolean
        {
            var _local_4:IRoomObjectController = getObjectRoom(_arg_1);
            if (((_local_4 == null) || (_local_4.getEventHandler() == null)))
            {
                return (false);
            };
            var _local_5:RoomObjectRoomPlaneVisibilityUpdateMessage;
            _local_5 = new RoomObjectRoomPlaneVisibilityUpdateMessage("RORPVUM_WALL_VISIBILITY", _arg_2);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            _local_5 = new RoomObjectRoomPlaneVisibilityUpdateMessage("RORPVUM_FLOOR_VISIBILITY", _arg_3);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            return (true);
        }

        public function updateObjectRoomPlaneThicknesses(_arg_1:int, _arg_2:Number, _arg_3:Number):Boolean
        {
            var _local_4:IRoomObjectController = getObjectRoom(_arg_1);
            if (((_local_4 == null) || (_local_4.getEventHandler() == null)))
            {
                return (false);
            };
            var _local_5:RoomObjectRoomPlanePropertyUpdateMessage;
            _local_5 = new RoomObjectRoomPlanePropertyUpdateMessage("RORPPUM_WALL_THICKNESS", _arg_2);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            _local_5 = new RoomObjectRoomPlanePropertyUpdateMessage("RORPVUM_FLOOR_THICKNESS", _arg_3);
            _local_4.getEventHandler().processUpdateMessage(_local_5);
            return (true);
        }

        public function disposeRoom(_arg_1:int):void
        {
            var _local_2:String = getRoomIdentifier(_arg_1);
            _roomManager.disposeRoom(_local_2);
            var _local_3:_SafeStr_3110 = _SafeStr_3708.remove(_local_2);
            if (_local_3 != null)
            {
                _local_3.dispose();
            };
            events.dispatchEvent(new RoomEngineEvent("REE_DISPOSED", _arg_1));
        }

        public function setOwnUserId(_arg_1:int, _arg_2:int):void
        {
            var _local_3:IRoomSession = _roomSessionManager.getSession(_arg_1);
            if (_local_3)
            {
                _local_3.ownUserRoomId = _arg_2;
            };
            var _local_4:_SafeStr_3120 = getRoomCamera(_arg_1);
            if (_local_4 != null)
            {
                _local_4.targetId = _arg_2;
                _local_4.targetCategory = 100;
                _local_4.activateFollowing(cameraFollowDuration);
            };
        }

        public function createRoomCanvas(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):DisplayObject
        {
            var _local_17:Number;
            var _local_16:Number;
            var _local_14:Number;
            var _local_12:Number;
            var _local_13:* = null;
            var _local_15:* = null;
            var _local_8:* = null;
            var _local_11:String = getRoomIdentifier(_arg_1);
            var _local_9:IRoomInstance = _roomManager.getRoom(_local_11);
            if (_local_9 == null)
            {
                return (null);
            };
            var _local_6:IRoomRenderer = (_local_9.getRenderer() as IRoomRenderer);
            if (_local_6 == null)
            {
                _local_6 = _roomRendererFactory.createRenderer();
            };
            if (_local_6 == null)
            {
                return (null);
            };
            _local_6.roomObjectVariableAccurateZ = "object_accurate_z_value";
            _local_9.setRenderer(_local_6);
            var _local_7:IRoomRenderingCanvas = _local_6.createCanvas(_arg_2, _arg_3, _arg_4, _arg_5);
            if (_local_7 == null)
            {
                return (null);
            };
            _local_7.mouseListener = _SafeStr_3700;
            if (_local_7.geometry != null)
            {
                _local_7.geometry.z_scale = _local_9.getNumber("room_z_scale");
            };
            if (_local_7.geometry != null)
            {
                _local_17 = _local_9.getNumber("room_door_x");
                _local_16 = _local_9.getNumber("room_door_y");
                _local_14 = _local_9.getNumber("room_door_z");
                _local_12 = _local_9.getNumber("room_door_dir");
                _local_13 = new Vector3d(_local_17, _local_16, _local_14);
                _local_15 = null;
                if (_local_12 == 90)
                {
                    _local_15 = new Vector3d(-2000, 0, 0);
                };
                if (_local_12 == 180)
                {
                    _local_15 = new Vector3d(0, -2000, 0);
                };
                _local_7.geometry.setDisplacement(_local_13, _local_15);
            };
            var _local_10:Sprite = (_local_7.displayObject as Sprite);
            if (_local_10 != null)
            {
                _local_8 = new Sprite();
                _local_8.name = "overlay";
                _local_8.mouseEnabled = false;
                _local_10.addChild(_local_8);
            };
            return (_local_10);
        }

        public function setRoomCanvasScale(_arg_1:int, _arg_2:int, _arg_3:Number, _arg_4:Point=null, _arg_5:Point=null, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Boolean=false):void
        {
            var _local_10:* = null;
            var _local_11:* = null;
            if (!getBoolean("zoom.enabled"))
            {
                return;
            };
            if (!_arg_7)
            {
                _arg_3 = ((_arg_6) ? -1 : ((_arg_3 < 1) ? 0.5 : Math.floor(_arg_3)));
            };
            var _local_9:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            if (_local_9 != null)
            {
                _local_9.setScale(_arg_3, _arg_4, _arg_5, _arg_8);
                _local_10 = getRoomInstanceData(_SafeStr_3699);
                if (_local_10 != null)
                {
                    _local_11 = _local_10.roomCamera;
                };
                events.dispatchEvent(new RoomEngineEvent("REE_ROOM_ZOOMED", _arg_1));
            };
        }

        public function getRoomCanvasScale(_arg_1:int=-1000, _arg_2:int=-1):Number
        {
            if (_arg_1 == -1000)
            {
                _arg_1 = _SafeStr_3699;
            };
            if (_arg_2 == -1)
            {
                _arg_2 = _SafeStr_3714;
            };
            var _local_3:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            if (_local_3 == null)
            {
                return (1);
            };
            return (_local_3.scale);
        }

        public function getRoomCanvas(_arg_1:int, _arg_2:int):IRoomRenderingCanvas
        {
            var _local_3:String = getRoomIdentifier(_arg_1);
            var _local_6:IRoomInstance = _roomManager.getRoom(_local_3);
            if (_local_6 == null)
            {
                return (null);
            };
            var _local_4:IRoomRenderer = (_local_6.getRenderer() as IRoomRenderer);
            if (_local_4 == null)
            {
                return (null);
            };
            var _local_5:IRoomRenderingCanvas = _local_4.getCanvas(_arg_2);
            return (_local_5);
        }

        public function modifyRoomCanvas(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):Boolean
        {
            var _local_5:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            if (_local_5 == null)
            {
                return (false);
            };
            _local_5.initialize(_arg_3, _arg_4);
            return (true);
        }

        public function setRoomCanvasMask(_arg_1:int, _arg_2:int, _arg_3:Boolean):void
        {
            var _local_4:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            if (_local_4 == null)
            {
                return;
            };
            _local_4.useMask = _arg_3;
        }

        private function getRoomCanvasRectangle(_arg_1:int, _arg_2:int):Rectangle
        {
            var _local_3:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            if (_local_3 == null)
            {
                return (null);
            };
            return (new Rectangle(0, 0, _local_3.width, _local_3.height));
        }

        public function getRoomCanvasGeometry(_arg_1:int, _arg_2:int=-1):IRoomGeometry
        {
            if (_arg_2 == -1)
            {
                _arg_2 = _SafeStr_3714;
            };
            var _local_3:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            if (_local_3 == null)
            {
                return (null);
            };
            return (_local_3.geometry);
        }

        public function getRoomCanvasScreenOffset(_arg_1:int, _arg_2:int=-1):Point
        {
            if (_arg_2 == -1)
            {
                _arg_2 = _SafeStr_3714;
            };
            var _local_3:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            if (_local_3 == null)
            {
                return (null);
            };
            return (new Point(_local_3.screenOffsetX, _local_3.screenOffsetY));
        }

        public function setRoomCanvasScreenOffset(_arg_1:int, _arg_2:int, _arg_3:Point):Boolean
        {
            var _local_4:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            if (((_local_4 == null) || (_arg_3 == null)))
            {
                return (false);
            };
            _local_4.screenOffsetX = _arg_3.x;
            _local_4.screenOffsetY = _arg_3.y;
            return (true);
        }

        public function snapshotRoomCanvasToBitmap(_arg_1:int, _arg_2:int, _arg_3:BitmapData, _arg_4:Matrix, _arg_5:Boolean):Boolean
        {
            var _local_7:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            if (!_local_7)
            {
                return (false);
            };
            var _local_6:DisplayObject = _local_7.displayObject;
            if (!_local_6)
            {
                return (false);
            };
            _arg_3.draw(_local_6, _arg_4, null, null, null, _arg_5);
            return (true);
        }

        private function handleRoomDragging(_arg_1:IRoomRenderingCanvas, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean):Boolean
        {
            var _local_10:* = null;
            var _local_11:* = null;
            if (_SafeStr_3710)
            {
                return (false);
            };
            var _local_9:int = (_arg_2 - _SafeStr_3715);
            var _local_8:int = (_arg_3 - _SafeStr_3716);
            if (_arg_4 == "mouseDown")
            {
                if (((((!(_arg_5)) && (!(_arg_6))) && (!(_arg_7))) && (!(isDecorateMode))))
                {
                    _SafeStr_3711 = true;
                    _SafeStr_3717 = false;
                    _SafeStr_3719 = _SafeStr_3715;
                    _SafeStr_3720 = _SafeStr_3716;
                    _SafeStr_3718 = _SafeStr_3697;
                    _SafeStr_3697 = 0;
                };
            }
            else
            {
                if (_arg_4 == "mouseUp")
                {
                    if (_SafeStr_3711)
                    {
                        _SafeStr_3711 = false;
                        if (_SafeStr_3717)
                        {
                            _local_10 = getRoomInstanceData(_SafeStr_3699);
                            if (_local_10 != null)
                            {
                                _local_11 = _local_10.roomCamera;
                                if (_local_11 != null)
                                {
                                    if (useOffsetScrolling)
                                    {
                                        if (!_local_11.isMoving)
                                        {
                                            _local_11.centeredLocX = false;
                                            _local_11.centeredLocY = false;
                                        };
                                        _local_11.resetLocation(new Vector3d(-(_arg_1.screenOffsetX), -(_arg_1.screenOffsetY)));
                                    };
                                    if (_roomDraggingAlwaysCenters)
                                    {
                                        _local_11.reset();
                                    };
                                };
                            };
                            events.dispatchEvent(new RoomEngineDragWithMouseEvent("REDWME_DRAG_END", _SafeStr_3699));
                        };
                    };
                    if (_SafeStr_3718 != 0)
                    {
                        _SafeStr_3697 = _SafeStr_3718;
                        _SafeStr_3718 = 0;
                    };
                }
                else
                {
                    if (_arg_4 == "mouseMove")
                    {
                        if (_SafeStr_3711)
                        {
                            if (!_SafeStr_3717)
                            {
                                _local_9 = (_arg_2 - _SafeStr_3719);
                                _local_8 = (_arg_3 - _SafeStr_3720);
                                if (((((_local_9 <= -(15)) || (_local_9 >= 15)) || (_local_8 <= -(15))) || (_local_8 >= 15)))
                                {
                                    _SafeStr_3717 = true;
                                    events.dispatchEvent(new RoomEngineDragWithMouseEvent("REDWME_DRAG_START", _SafeStr_3699));
                                };
                                _local_9 = 0;
                                _local_8 = 0;
                            };
                            if (((!(_local_9 == 0)) || (!(_local_8 == 0))))
                            {
                                _SafeStr_3712 = (_SafeStr_3712 + _local_9);
                                _SafeStr_3713 = (_SafeStr_3713 + _local_8);
                                if (!_SafeStr_3717)
                                {
                                    events.dispatchEvent(new RoomEngineDragWithMouseEvent("REDWME_DRAG_START", _SafeStr_3699));
                                };
                                _SafeStr_3717 = true;
                            };
                        };
                    }
                    else
                    {
                        if (((_arg_4 == "click") || (_arg_4 == "doubleClick")))
                        {
                            _SafeStr_3711 = false;
                            if (_SafeStr_3717)
                            {
                                _SafeStr_3717 = false;
                                return (true);
                            };
                        };
                    };
                };
            };
            return (false);
        }

        public function handleRoomCanvasMouseEvent(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean, _arg_8:Boolean):void
        {
            var _local_12:Number;
            var _local_10:* = null;
            var _local_11:* = null;
            var _local_15:* = null;
            var _local_14:* = null;
            var _local_13:* = null;
            if (((_SafeStr_3696 > 0) && (_arg_3 < _SafeStr_3696)))
            {
                return;
            };
            if (((_SafeStr_3697 > 0) && (_arg_2 < _SafeStr_3697)))
            {
                return;
            };
            var _local_9:IRoomRenderingCanvas = getRoomCanvas(_SafeStr_3699, _arg_1);
            if (_local_9 != null)
            {
                if (((((_sessionDataManager.isPerkAllowed("MOUSE_ZOOM")) && (_arg_4 == "click")) && (_arg_6)) && (_arg_5)))
                {
                    _local_12 = ((_arg_7) ? (_local_9.scale >> 1) : ((_local_9.scale < 1) ? 1 : (_local_9.scale << 1)));
                    setRoomCanvasScale(activeRoomId, _SafeStr_3714, _local_12, new Point(_arg_2, _arg_3));
                    return;
                };
                _local_10 = getOverlaySprite(_local_9);
                _local_11 = getOverlayIconSprite(_local_10, "object_icon_sprite");
                if (_local_11 != null)
                {
                    _local_15 = _local_11.getRect(_local_11);
                    _local_11.x = (_arg_2 - (_local_15.width / 2));
                    _local_11.y = (_arg_3 - (_local_15.height / 2));
                };
                if (!handleRoomDragging(_local_9, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7))
                {
                    if (!_local_9.handleMouseEvent(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8))
                    {
                        _local_14 = "";
                        if (_arg_4 == "click")
                        {
                            if (events != null)
                            {
                                events.dispatchEvent(new RoomEngineObjectEvent("REOE_DESELECTED", _SafeStr_3699, -1, -2));
                            };
                            _local_14 = "ROE_MOUSE_CLICK";
                        }
                        else
                        {
                            if (_arg_4 == "mouseMove")
                            {
                                _local_14 = "ROE_MOUSE_MOVE";
                            }
                            else
                            {
                                if (_arg_4 == "mouseDown")
                                {
                                    _local_14 = "ROE_MOUSE_DOWN";
                                };
                            };
                        };
                        if (_SafeStr_3700 != null)
                        {
                            _local_13 = new RoomObjectMouseEvent(_local_14, getRoomObject(_SafeStr_3699, -1, 0), null, _arg_5);
                            _SafeStr_3700.handleRoomObjectEvent(_local_13, _SafeStr_3699);
                        };
                    };
                };
                _SafeStr_3714 = _arg_1;
                _SafeStr_3715 = _arg_2;
                _SafeStr_3716 = _arg_3;
            };
        }

        private function getOverlaySprite(_arg_1:IRoomRenderingCanvas):Sprite
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_3:Sprite = (_arg_1.displayObject as Sprite);
            if (_local_3 == null)
            {
                return (null);
            };
            return (_local_3.getChildByName("overlay") as Sprite);
        }

        private function addOverlayIconSprite(_arg_1:Sprite, _arg_2:String, _arg_3:BitmapData):Sprite
        {
            if (((_arg_1 == null) || (_arg_3 == null)))
            {
                return (null);
            };
            var _local_5:Sprite = getOverlayIconSprite(_arg_1, _arg_2);
            if (_local_5 != null)
            {
                return (null);
            };
            _local_5 = new Sprite();
            _local_5.name = _arg_2;
            _local_5.mouseEnabled = false;
            var _local_4:Bitmap = new Bitmap(_arg_3);
            _local_5.addChild(_local_4);
            _arg_1.addChild(_local_5);
            return (_local_5);
        }

        private function removeOverlayIconSprite(_arg_1:Sprite, _arg_2:String):Boolean
        {
            var _local_5:int;
            var _local_4:* = null;
            var _local_3:* = null;
            if (_arg_1 == null)
            {
                return (false);
            };
            _local_5 = (_arg_1.numChildren - 1);
            while (_local_5 >= 0)
            {
                _local_4 = (_arg_1.getChildAt(_local_5) as Sprite);
                if (_local_4 != null)
                {
                    if (_local_4.name == _arg_2)
                    {
                        _arg_1.removeChildAt(_local_5);
                        _local_3 = (_local_4.getChildAt(0) as Bitmap);
                        if (((!(_local_3 == null)) && (!(_local_3.bitmapData == null))))
                        {
                            _local_3.bitmapData.dispose();
                            _local_3.bitmapData = null;
                        };
                        return (true);
                    };
                };
                _local_5--;
            };
            return (false);
        }

        private function getOverlayIconSprite(_arg_1:Sprite, _arg_2:String):Sprite
        {
            var _local_4:int;
            var _local_3:* = null;
            if (_arg_1 == null)
            {
                return (null);
            };
            _local_4 = (_arg_1.numChildren - 1);
            while (_local_4 >= 0)
            {
                _local_3 = (_arg_1.getChildAt(_local_4) as Sprite);
                if (_local_3 != null)
                {
                    if (_local_3.name == _arg_2)
                    {
                        return (_local_3);
                    };
                };
                _local_4--;
            };
            return (null);
        }

        public function setObjectMoverIconSprite(_arg_1:int, _arg_2:int, _arg_3:Boolean, _arg_4:String=null, _arg_5:IStuffData=null, _arg_6:int=-1, _arg_7:int=-1, _arg_8:String=null):void
        {
            var _local_13:* = null;
            var _local_12:int;
            var _local_14:* = null;
            var _local_10:* = null;
            var _local_11:* = null;
            var _local_15:_SafeStr_3248;
            if (_arg_3)
            {
                _local_15 = getRoomObjectImage(_SafeStr_3699, _arg_1, _arg_2, new Vector3d(), 1, null);
            }
            else
            {
                if (_SafeStr_3701 != null)
                {
                    _local_13 = null;
                    _local_12 = 0;
                    if (_arg_2 == 10)
                    {
                        _local_13 = _SafeStr_3701.getActiveObjectType(_arg_1);
                        _local_12 = _SafeStr_3701.getActiveObjectColorIndex(_arg_1);
                    }
                    else
                    {
                        if (_arg_2 == 20)
                        {
                            _local_13 = _SafeStr_3701.getWallItemType(_arg_1, _arg_4);
                            _local_12 = _SafeStr_3701.getWallItemColorIndex(_arg_1);
                        };
                    };
                    if (_arg_2 == 100)
                    {
                        _local_13 = RoomObjectUserTypes.getName(_arg_1);
                        if (_local_13 == "pet")
                        {
                            _local_13 = getPetType(_arg_4);
                            _local_14 = new PetFigureData(_arg_4);
                            _local_15 = getPetImage(_local_14.typeId, _local_14.paletteId, _local_14.color, new Vector3d(180), 64, null, true, 0, _local_14.customParts, _arg_8);
                        }
                        else
                        {
                            _local_15 = getGenericRoomObjectImage(_local_13, _arg_4, new Vector3d(180), 1, null, 0, null, _arg_5, _arg_6, _arg_7, _arg_8);
                        };
                    }
                    else
                    {
                        _local_15 = getGenericRoomObjectImage(_local_13, _local_12, new Vector3d(), 1, null, 0, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8);
                    };
                };
            };
            if (((_local_15 == null) || (_local_15.data == null)))
            {
                return;
            };
            var _local_9:IRoomRenderingCanvas = getActiveRoomActiveCanvas();
            if (_local_9 != null)
            {
                _local_10 = getOverlaySprite(_local_9);
                removeOverlayIconSprite(_local_10, "object_icon_sprite");
                _local_11 = addOverlayIconSprite(_local_10, "object_icon_sprite", _local_15.data);
                if (_local_11 != null)
                {
                    _local_11.x = (_SafeStr_3715 - (_local_15.data.width / 2));
                    _local_11.y = (_SafeStr_3716 - (_local_15.data.height / 2));
                };
            };
        }

        public function setObjectMoverIconSpriteVisible(_arg_1:Boolean):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:IRoomRenderingCanvas = getActiveRoomActiveCanvas();
            if (_local_2 != null)
            {
                _local_3 = getOverlaySprite(_local_2);
                _local_4 = getOverlayIconSprite(_local_3, "object_icon_sprite");
                if (_local_4 != null)
                {
                    _local_4.visible = _arg_1;
                };
            };
        }

        public function removeObjectMoverIconSprite():void
        {
            var _local_2:* = null;
            var _local_1:IRoomRenderingCanvas = getActiveRoomActiveCanvas();
            if (_local_1 != null)
            {
                _local_2 = getOverlaySprite(_local_1);
                removeOverlayIconSprite(_local_2, "object_icon_sprite");
            };
        }

        public function getRoomObjectCount(_arg_1:int, _arg_2:int):int
        {
            if (!_SafeStr_3698)
            {
                return (0);
            };
            var _local_3:String = getRoomIdentifier(_arg_1);
            var _local_4:IRoomInstance = _roomManager.getRoom(_local_3);
            if (_local_4 == null)
            {
                return (0);
            };
            return (_local_4.getObjectCount(_arg_2));
        }

        public function getRoomObject(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject
        {
            if (!_SafeStr_3698)
            {
                return (null);
            };
            var _local_4:String = getRoomIdentifier(_arg_1);
            if (_arg_1 == 0)
            {
                _local_4 = "temporary_room";
            };
            return (getObject(_local_4, _arg_2, _arg_3));
        }

        public function getObjectsByCategory(_arg_1:int):Array
        {
            var _local_2:IRoomInstance;
            if (_roomManager != null)
            {
                _local_2 = _roomManager.getRoom(getRoomIdentifier(_SafeStr_3699));
            };
            if (_local_2 == null)
            {
                return ([]);
            };
            return (_local_2.getObjects(_arg_1));
        }

        public function getRoomObjectWithIndex(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject
        {
            if (!_SafeStr_3698)
            {
                return (null);
            };
            var _local_4:String = getRoomIdentifier(_arg_1);
            var _local_5:IRoomInstance = _roomManager.getRoom(_local_4);
            if (_local_5 == null)
            {
                return (null);
            };
            var _local_6:IRoomObject = _local_5.getObjectWithIndex(_arg_2, _arg_3);
            return (_local_6);
        }

        public function getRoomObjects(_arg_1:int, _arg_2:int):Array
        {
            var _local_3:* = null;
            var _local_4:* = null;
            if (_SafeStr_3698)
            {
                _local_3 = getRoomIdentifier(_arg_1);
                _local_4 = _roomManager.getRoom(_local_3);
                if (_local_4 != null)
                {
                    return (_local_4.getObjects(_arg_2));
                };
            };
            return ([]);
        }

        public function modifyRoomObject(_arg_1:int, _arg_2:int, _arg_3:String):Boolean
        {
            if (_SafeStr_3700 != null)
            {
                return (_SafeStr_3700.modifyRoomObject(_SafeStr_3699, _arg_1, _arg_2, _arg_3));
            };
            return (false);
        }

        public function modifyRoomObjectDataWithMap(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:_SafeStr_24):Boolean
        {
            if (_SafeStr_3700 != null)
            {
                if (_arg_2 == 10)
                {
                    return (_SafeStr_3700.modifyRoomObjectData(_SafeStr_3699, _arg_1, _arg_2, _arg_3, _arg_4));
                };
            };
            return (false);
        }

        public function modifyRoomObjectData(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String):Boolean
        {
            if (_SafeStr_3700 != null)
            {
                if (_arg_2 == 20)
                {
                    return (_SafeStr_3700.modifyWallItemData(_SafeStr_3699, _arg_1, _arg_3, _arg_4));
                };
            };
            return (false);
        }

        public function deleteRoomObject(_arg_1:int, _arg_2:int):Boolean
        {
            if (_SafeStr_3700 != null)
            {
                if (_arg_2 == 20)
                {
                    return (_SafeStr_3700.deleteWallItem(_SafeStr_3699, _arg_1));
                };
            };
            return (false);
        }

        public function initializeRoomObjectInsert(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String=null, _arg_6:IStuffData=null, _arg_7:int=-1, _arg_8:int=-1, _arg_9:String=null):Boolean
        {
            var _local_10:IRoomInstance = getRoom(_SafeStr_3699);
            if (((_local_10 == null) || (!(_local_10.getNumber("room_is_public") == 0))))
            {
                return (false);
            };
            if (_SafeStr_3700 != null)
            {
                return (_SafeStr_3700.initializeRoomObjectInsert(_arg_1, _SafeStr_3699, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9));
            };
            return (false);
        }

        public function cancelRoomObjectInsert():void
        {
            if (_SafeStr_3700 != null)
            {
                _SafeStr_3700.cancelRoomObjectInsert(_SafeStr_3699);
            };
        }

        public function useRoomObjectInActiveRoom(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:* = null;
            var _local_4:IRoomObject = getRoomObject(_SafeStr_3699, _arg_1, _arg_2);
            if (_local_4 != null)
            {
                _local_3 = (_local_4.getMouseHandler() as IRoomObjectEventHandler);
                if (_local_3 != null)
                {
                    _local_3.useObject();
                    return (true);
                };
            };
            return (false);
        }

        private function getRoomObjectAdURL(_arg_1:String):String
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getRoomObjectAdURL(_arg_1));
            };
            return ("");
        }

        public function setRoomObjectAlias(_arg_1:String, _arg_2:String):void
        {
            if (_SafeStr_3701 != null)
            {
                _SafeStr_3701.setRoomObjectAlias(_arg_1, _arg_2);
            };
        }

        public function getRoomObjectCategory(_arg_1:String):int
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getObjectCategory(_arg_1));
            };
            return (-2);
        }

        public function getFurnitureType(_arg_1:int):String
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getActiveObjectType(_arg_1));
            };
            return ("");
        }

        public function getFurnitureTypeId(_arg_1:String):int
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getActiveObjectTypeId(_arg_1));
            };
            return (0);
        }

        public function getWallItemType(_arg_1:int, _arg_2:String=null):String
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getWallItemType(_arg_1, _arg_2));
            };
            return ("");
        }

        public function getPetTypeId(_arg_1:String):int
        {
            var _local_2:* = null;
            var _local_3:int = -1;
            if (_arg_1 != null)
            {
                _local_2 = _arg_1.split(" ");
                if (_local_2.length > 1)
                {
                    _local_3 = parseInt(_local_2[0]);
                };
            };
            return (_local_3);
        }

        private function getPetType(_arg_1:String):String
        {
            var _local_2:* = null;
            var _local_3:int;
            if (_arg_1 != null)
            {
                _local_2 = _arg_1.split(" ");
                if (_local_2.length > 1)
                {
                    _local_3 = parseInt(_local_2[0]);
                    if (_SafeStr_3701 != null)
                    {
                        return (_SafeStr_3701.getPetType(_local_3));
                    };
                    return ("pet");
                };
            };
            return (null);
        }

        public function getPetColor(_arg_1:int, _arg_2:int):PetColorResult
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getPetColor(_arg_1, _arg_2));
            };
            return (null);
        }

        public function getPetColorsByTag(_arg_1:int, _arg_2:String):Array
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getPetColorsByTag(_arg_1, _arg_2));
            };
            return (null);
        }

        public function getPetLayerIdForTag(_arg_1:int, _arg_2:String):int
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getPetLayerIdForTag(_arg_1, _arg_2));
            };
            return (-1);
        }

        public function getPetDefaultPalette(_arg_1:int, _arg_2:String):PetColorResult
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getPetDefaultPalette(_arg_1, _arg_2));
            };
            return (null);
        }

        private function getFurnitureColorIndex(_arg_1:int):int
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getActiveObjectColorIndex(_arg_1));
            };
            return (0);
        }

        private function getWallItemColorIndex(_arg_1:int):int
        {
            if (_SafeStr_3701 != null)
            {
                return (_SafeStr_3701.getWallItemColorIndex(_arg_1));
            };
            return (0);
        }

        public function getSelectionArrow(_arg_1:int):IRoomObjectController
        {
            return (getObject(getRoomIdentifier(_arg_1), -3, 200));
        }

        public function getTileCursor(_arg_1:int):IRoomObjectController
        {
            return (getObject(getRoomIdentifier(_arg_1), -2, 200));
        }

        public function setTileCursorState(_arg_1:int, _arg_2:int):void
        {
            var _local_4:* = null;
            var _local_3:IRoomObjectController = getTileCursor(_arg_1);
            if (((!(_local_3 == null)) && (!(_local_3.getEventHandler() == null))))
            {
                _local_4 = new RoomObjectDataUpdateMessage(_arg_2, null);
                _local_3.getEventHandler().processUpdateMessage(_local_4);
            };
        }

        public function toggleTileCursorVisibility(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_4:* = null;
            var _local_3:IRoomObjectController = getTileCursor(_arg_1);
            if (((!(_local_3 == null)) && (!(_local_3.getEventHandler() == null))))
            {
                _local_4 = new RoomObjectTileCursorUpdateMessage(null, 0, _arg_2, "", true);
                _local_3.getEventHandler().processUpdateMessage(_local_4);
            };
        }

        public function addObjectFurniture(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN, _arg_9:int=-1, _arg_10:int=0, _arg_11:int=0, _arg_12:String="", _arg_13:Boolean=true, _arg_14:Boolean=true, _arg_15:Number=-1):Boolean
        {
            var _local_17:* = null;
            var _local_16:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_16 != null)
            {
                _local_17 = new _SafeStr_3247(_arg_2, _arg_3, null, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11, _arg_12, _arg_13, _arg_14, _arg_15);
                _local_16.addFurnitureData(_local_17);
            };
            return (true);
        }

        public function addObjectFurnitureByName(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN):Boolean
        {
            var _local_11:* = null;
            var _local_9:String = getWorldType(_arg_1);
            var _local_10:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_10 != null)
            {
                _local_11 = new _SafeStr_3247(_arg_2, 0, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, 0);
                _local_10.addFurnitureData(_local_11);
            };
            return (true);
        }

        private function addObjectFurnitureFromData(_arg_1:int, _arg_2:int, _arg_3:_SafeStr_3247):Boolean
        {
            var _local_4:* = null;
            if (_arg_3 == null)
            {
                _local_4 = getRoomInstanceData(_arg_1);
                if (_local_4 != null)
                {
                    _arg_3 = _local_4.getFurnitureDataWithId(_arg_2);
                };
            };
            if (_arg_3 == null)
            {
                return (false);
            };
            var _local_6:Boolean;
            var _local_9:String = _arg_3.type;
            if (_local_9 == null)
            {
                _local_9 = getFurnitureType(_arg_3.typeId);
                _local_6 = true;
            };
            var _local_7:int = getFurnitureColorIndex(_arg_3.typeId);
            var _local_8:String = getRoomObjectAdURL(_local_9);
            if (_local_9 == null)
            {
                _local_9 = "";
            };
            var _local_10:IRoomObjectController = createObjectFurniture(_arg_1, _arg_2, _local_9);
            if (_local_10 == null)
            {
                return (false);
            };
            if ((((!(_local_10 == null)) && (!(_local_10.getModelController() == null))) && (_local_6)))
            {
                _local_10.getModelController().setNumber("furniture_color", _local_7, true);
                _local_10.getModelController().setNumber("furniture_type_id", _arg_3.typeId, true);
                _local_10.getModelController().setString("furniture_ad_url", _local_8, true);
                _local_10.getModelController().setNumber("furniture_real_room_object", ((_arg_3.realRoomObject) ? 1 : 0), false);
                _local_10.getModelController().setNumber("furniture_expiry_time", _arg_3.expiryTime);
                _local_10.getModelController().setNumber("furniture_expirty_timestamp", getTimer());
                _local_10.getModelController().setNumber("furniture_usage_policy", _arg_3.usagePolicy);
                _local_10.getModelController().setNumber("furniture_owner_id", _arg_3.ownerId);
                _local_10.getModelController().setString("furniture_owner_name", _arg_3.ownerName);
            };
            if (!updateObjectFurniture(_arg_1, _arg_2, _arg_3.loc, _arg_3.dir, _arg_3.state, _arg_3.data, _arg_3.extra))
            {
                return (false);
            };
            if (_arg_3.sizeZ >= 0)
            {
                if (!updateObjectFurnitureHeight(_arg_1, _arg_2, _arg_3.sizeZ))
                {
                    return (false);
                };
            };
            if (events != null)
            {
                events.dispatchEvent(new RoomEngineObjectEvent("REOE_ADDED", _arg_1, _arg_2, 10));
            };
            var _local_5:ISelectedRoomObjectData = getPlacedObjectData(_arg_1);
            if ((((_local_5) && (Math.abs(_local_5.id) == _arg_2)) && (_local_5.category == 10)))
            {
                selectRoomObject(_arg_1, _arg_2, 10);
            };
            if (((_local_10.isInitialized()) && (_arg_3.synchronized)))
            {
                addObjectToTileMap(_arg_1, _local_10);
            };
            return (true);
        }

        public function changeObjectState(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_6:Number;
            var _local_5:int;
            var _local_4:* = null;
            var _local_7:* = null;
            var _local_8:IRoomObjectController = getObject(getRoomIdentifier(_arg_1), _arg_2, _arg_3);
            if (((!(_local_8 == null)) && (!(_local_8.getModelController() == null))))
            {
                _local_6 = _local_8.getModelController().getNumber("furniture_automatic_state_index");
                if (isNaN(_local_6))
                {
                    _local_6 = 1;
                }
                else
                {
                    _local_6 = (_local_6 + 1);
                };
                _local_8.getModelController().setNumber("furniture_automatic_state_index", _local_6);
                _local_5 = _local_8.getModel().getNumber("furniture_data_format");
                _local_4 = _SafeStr_1588.getStuffDataWrapperForType(_local_5);
                _local_4.initializeFromRoomObjectModel(_local_8.getModel());
                _local_7 = new RoomObjectDataUpdateMessage(_local_6, _local_4);
                if (_local_8.getEventHandler() != null)
                {
                    _local_8.getEventHandler().processUpdateMessage(_local_7);
                };
            };
        }

        public function changeObjectModelData(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:int):Boolean
        {
            var _local_6:* = null;
            var _local_7:IRoomObjectController = getObject(getRoomIdentifier(_arg_1), _arg_2, _arg_3);
            if (_local_7 == null)
            {
                return (false);
            };
            if (((!(_local_7 == null)) && (!(_local_7.getEventHandler() == null))))
            {
                _local_6 = new RoomObjectModelDataUpdateMessage(_arg_4, _arg_5);
                _local_7.getEventHandler().processUpdateMessage(_local_6);
            };
            return (true);
        }

        public function updateObjectFurniture(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:IStuffData, _arg_7:Number=NaN):Boolean
        {
            var _local_10:IRoomObjectController = getObjectFurniture(_arg_1, _arg_2);
            if (_local_10 == null)
            {
                return (false);
            };
            var _local_8:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(_arg_3, _arg_4);
            var _local_9:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(_arg_5, _arg_6, _arg_7);
            if (((!(_local_10 == null)) && (!(_local_10.getEventHandler() == null))))
            {
                _local_10.getEventHandler().processUpdateMessage(_local_8);
                _local_10.getEventHandler().processUpdateMessage(_local_9);
            };
            return (true);
        }

        public function updateObjectFurnitureHeight(_arg_1:int, _arg_2:int, _arg_3:Number):Boolean
        {
            var _local_4:* = null;
            var _local_5:IRoomObjectController = getObjectFurniture(_arg_1, _arg_2);
            if (_local_5 == null)
            {
                return (false);
            };
            if (((!(_local_5 == null)) && (!(_local_5.getEventHandler() == null))))
            {
                _local_4 = new RoomObjectHeightUpdateMessage(null, null, _arg_3);
                _local_5.getEventHandler().processUpdateMessage(_local_4);
            };
            return (true);
        }

        public function updateObjectFurnitureLocation(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d):Boolean
        {
            var _local_5:* = null;
            var _local_6:IRoomObjectController = getObjectFurniture(_arg_1, _arg_2);
            if (_local_6 == null)
            {
                return (false);
            };
            if (((!(_local_6 == null)) && (!(_local_6.getEventHandler() == null))))
            {
                _local_5 = new RoomObjectMoveUpdateMessage(_arg_3, _arg_4, null, (!(_arg_4 == null)));
                _local_6.getEventHandler().processUpdateMessage(_local_5);
            };
            return (true);
        }

        public function updateObjectFurnitureExpiryTime(_arg_1:int, _arg_2:int, _arg_3:int):Boolean
        {
            var _local_4:IRoomObjectController = getObjectFurniture(_arg_1, _arg_2);
            if (_local_4 == null)
            {
                return (false);
            };
            _local_4.getModelController().setNumber("furniture_expiry_time", _arg_3);
            _local_4.getModelController().setNumber("furniture_expirty_timestamp", getTimer());
            return (true);
        }

        private function createObjectFurniture(_arg_1:int, _arg_2:int, _arg_3:String):IRoomObjectController
        {
            var _local_4:int = 10;
            var _local_5:IRoomObjectController = createObject(getRoomIdentifier(_arg_1), _arg_2, _arg_3, _local_4);
            return (_local_5);
        }

        private function getObjectFurniture(_arg_1:int, _arg_2:int):IRoomObjectController
        {
            return (getObject(getRoomIdentifier(_arg_1), _arg_2, 10));
        }

        public function disposeObjectFurniture(_arg_1:int, _arg_2:int, _arg_3:int=-1, _arg_4:Boolean=false):void
        {
            var _local_14:* = null;
            var _local_12:* = null;
            var _local_9:* = null;
            var _local_10:Boolean;
            var _local_11:int;
            var _local_7:* = null;
            var _local_13:int;
            var _local_8:* = null;
            var _local_5:* = null;
            var _local_6:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_6 != null)
            {
                _local_6.getFurnitureDataWithId(_arg_2);
            };
            if ((((_sessionDataManager) && (_arg_3 == _sessionDataManager.userId)) && (!(_SafeStr_3270.isBuilderClubId(_arg_2)))))
            {
                _local_14 = getRoomObject(_arg_1, _arg_2, 10);
                if (_local_14)
                {
                    _local_12 = getRoomObjectScreenLocation(_arg_1, _arg_2, 10, _SafeStr_3714);
                    if (_local_12)
                    {
                        _local_9 = _local_14.getModel();
                        _local_10 = (_local_9.getNumber("furniture_disable_picking_animation") == 1);
                        if (!_local_10)
                        {
                            _local_11 = _local_9.getNumber("furniture_type_id");
                            _local_7 = _local_9.getString("furniture_extras");
                            _local_13 = _local_9.getNumber("furniture_data_format");
                            _local_8 = _SafeStr_1588.getStuffDataWrapperForType(_local_13);
                            _local_5 = getFurnitureIcon(_local_11, null, _local_7, _local_8).data;
                            if (_local_5)
                            {
                                _toolbar.createTransitionToIcon("HTIE_ICON_INVENTORY", _local_5, _local_12.x, _local_12.y);
                            };
                        };
                    };
                };
            };
            disposeObject(_arg_1, _arg_2, 10);
            removeButtonMouseCursorOwner(_arg_1, 10, _arg_2);
            if (_arg_4)
            {
                refreshTileObjectMap(_arg_1, "RoomEngine.disposeObjectFurniture()");
            };
        }

        public function addObjectWallItem(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:String, _arg_8:int=0, _arg_9:int=0, _arg_10:String="", _arg_11:int=-1, _arg_12:Boolean=true):Boolean
        {
            var _local_15:* = null;
            var _local_14:* = null;
            var _local_13:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_13 != null)
            {
                _local_15 = new _SafeStr_1613();
                _local_15.setString(_arg_7);
                _local_14 = new _SafeStr_3247(_arg_2, _arg_3, null, _arg_4, _arg_5, _arg_6, _local_15, NaN, _arg_11, _arg_8, _arg_9, _arg_10, true, _arg_12);
                _local_13.addWallItemData(_local_14);
            };
            return (true);
        }

        private function addObjectWallItemFromData(_arg_1:int, _arg_2:int, _arg_3:_SafeStr_3247):Boolean
        {
            var _local_4:* = null;
            if (_arg_3 == null)
            {
                _local_4 = getRoomInstanceData(_arg_1);
                if (_local_4 != null)
                {
                    _arg_3 = _local_4.getWallItemDataWithId(_arg_2);
                };
            };
            if (_arg_3 == null)
            {
                return (false);
            };
            var _local_6:String = "";
            if (_arg_3.data != null)
            {
                _local_6 = _arg_3.data.getLegacyString();
            };
            var _local_9:String = getWallItemType(_arg_3.typeId, _local_6);
            var _local_7:int = getWallItemColorIndex(_arg_3.typeId);
            var _local_8:String = getRoomObjectAdURL(_local_9);
            if (_local_9 == null)
            {
                _local_9 = "";
            };
            var _local_10:IRoomObjectController = createObjectWallItem(_arg_1, _arg_2, _local_9);
            if (_local_10 == null)
            {
                return (false);
            };
            if (((!(_local_10 == null)) && (!(_local_10.getModelController() == null))))
            {
                _local_10.getModelController().setNumber("furniture_color", _local_7, false);
                _local_10.getModelController().setNumber("furniture_type_id", _arg_3.typeId, true);
                _local_10.getModelController().setString("furniture_ad_url", _local_8, true);
                _local_10.getModelController().setNumber("furniture_real_room_object", ((_arg_3.realRoomObject) ? 1 : 0), false);
                _local_10.getModelController().setNumber("object_accurate_z_value", 1, true);
                _local_10.getModelController().setNumber("furniture_usage_policy", _arg_3.usagePolicy);
                _local_10.getModelController().setNumber("furniture_expiry_time", _arg_3.expiryTime);
                _local_10.getModelController().setNumber("furniture_expirty_timestamp", getTimer());
                _local_10.getModelController().setNumber("furniture_owner_id", _arg_3.ownerId);
                _local_10.getModelController().setString("furniture_owner_name", _arg_3.ownerName);
            };
            _local_6 = "";
            if (_arg_3.data != null)
            {
                _local_6 = _arg_3.data.getLegacyString();
            };
            if (!updateObjectWallItem(_arg_1, _arg_2, _arg_3.loc, _arg_3.dir, _arg_3.state, _local_6))
            {
                return (false);
            };
            if (events != null)
            {
                events.dispatchEvent(new RoomEngineObjectEvent("REOE_ADDED", _arg_1, _arg_2, 20));
            };
            var _local_5:ISelectedRoomObjectData = getPlacedObjectData(_arg_1);
            if ((((_local_5) && (_local_5.id == _arg_2)) && (_local_5.category == 20)))
            {
                selectRoomObject(_arg_1, _arg_2, 20);
            };
            return (true);
        }

        public function updateObjectWallItem(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:int, _arg_6:String):Boolean
        {
            var _local_10:IRoomObjectController = getObjectWallItem(_arg_1, _arg_2);
            if (_local_10 == null)
            {
                return (false);
            };
            var _local_8:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(_arg_3, _arg_4);
            var _local_7:_SafeStr_1613 = new _SafeStr_1613();
            _local_7.setString(_arg_6);
            var _local_9:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(_arg_5, _local_7);
            if (((!(_local_10 == null)) && (!(_local_10.getEventHandler() == null))))
            {
                _local_10.getEventHandler().processUpdateMessage(_local_8);
                _local_10.getEventHandler().processUpdateMessage(_local_9);
            };
            updateObjectRoomWindow(_arg_1, _arg_2);
            return (true);
        }

        public function updateObjectRoomWindow(_arg_1:int, _arg_2:int, _arg_3:Boolean=true):void
        {
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_7:String = ("20_" + _arg_2);
            var _local_6:RoomObjectRoomMaskUpdateMessage;
            var _local_9:IRoomObjectController = getObjectWallItem(_arg_1, _arg_2);
            if (_local_9 != null)
            {
                if (_local_9.getModel() != null)
                {
                    if (_local_9.getModel().getNumber("furniture_uses_plane_mask") > 0)
                    {
                        _local_5 = _local_9.getModel().getString("furniture_plane_mask_type");
                        _local_4 = _local_9.getLocation();
                        if (_arg_3)
                        {
                            _local_6 = new RoomObjectRoomMaskUpdateMessage("RORMUM_ADD_MASK", _local_7, _local_5, _local_4);
                        }
                        else
                        {
                            _local_6 = new RoomObjectRoomMaskUpdateMessage("RORMUM_ADD_MASK", _local_7);
                        };
                    };
                };
            }
            else
            {
                _local_6 = new RoomObjectRoomMaskUpdateMessage("RORMUM_ADD_MASK", _local_7);
            };
            var _local_8:IRoomObjectController = getObjectRoom(_arg_1);
            if ((((!(_local_8 == null)) && (!(_local_8.getEventHandler() == null))) && (!(_local_6 == null))))
            {
                _local_8.getEventHandler().processUpdateMessage(_local_6);
            };
        }

        public function updateObjectWallItemData(_arg_1:int, _arg_2:int, _arg_3:String):Boolean
        {
            var _local_5:IRoomObjectController = getObjectWallItem(_arg_1, _arg_2);
            if (_local_5 == null)
            {
                return (false);
            };
            var _local_4:RoomObjectItemDataUpdateMessage = new RoomObjectItemDataUpdateMessage(_arg_3);
            if (((!(_local_5 == null)) && (!(_local_5.getEventHandler() == null))))
            {
                _local_5.getEventHandler().processUpdateMessage(_local_4);
            };
            return (true);
        }

        private function createObjectWallItem(_arg_1:int, _arg_2:int, _arg_3:String):IRoomObjectController
        {
            var _local_4:int = 20;
            var _local_5:IRoomObjectController = createObject(getRoomIdentifier(_arg_1), _arg_2, _arg_3, _local_4);
            return (_local_5);
        }

        private function getObjectWallItem(_arg_1:int, _arg_2:int):IRoomObjectController
        {
            return (getObject(getRoomIdentifier(_arg_1), _arg_2, 20));
        }

        public function updateObjectWallItemLocation(_arg_1:int, _arg_2:int, _arg_3:IVector3d):Boolean
        {
            var _local_4:* = null;
            var _local_5:IRoomObjectController = getObjectWallItem(_arg_1, _arg_2);
            if (_local_5 == null)
            {
                return (false);
            };
            if (_local_5.getEventHandler() != null)
            {
                _local_4 = new RoomObjectMoveUpdateMessage(_arg_3, null, null);
                _local_5.getEventHandler().processUpdateMessage(_local_4);
            };
            updateObjectRoomWindow(_arg_1, _arg_2);
            return (true);
        }

        public function updateObjectWallItemExpiryTime(_arg_1:int, _arg_2:int, _arg_3:int):Boolean
        {
            var _local_4:IRoomObjectController = getObjectWallItem(_arg_1, _arg_2);
            if (_local_4 == null)
            {
                return (false);
            };
            _local_4.getModelController().setNumber("furniture_expiry_time", _arg_3);
            _local_4.getModelController().setNumber("furniture_expirty_timestamp", getTimer());
            return (true);
        }

        public function disposeObjectWallItem(_arg_1:int, _arg_2:int, _arg_3:int=-1):void
        {
            var _local_10:* = null;
            var _local_6:* = null;
            var _local_8:* = null;
            var _local_9:int;
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_5:_SafeStr_3110 = getRoomInstanceData(_arg_1);
            if (_local_5 != null)
            {
                _local_5.getWallItemDataWithId(_arg_2);
            };
            if ((((_sessionDataManager) && (_arg_3 == _sessionDataManager.userId)) && (!(_SafeStr_3270.isBuilderClubId(_arg_2)))))
            {
                _local_10 = getRoomObject(_arg_1, _arg_2, 20);
                if ((((_local_10) && (_local_10.getType().indexOf("post_it") == -1)) && (_local_10.getType().indexOf("external_image_wallitem") == -1)))
                {
                    _local_6 = getRoomObjectScreenLocation(_arg_1, _arg_2, 20, _SafeStr_3714);
                    _local_8 = _local_10.getModel();
                    _local_9 = _local_8.getNumber("furniture_type_id");
                    _local_7 = _local_8.getString("furniture_data");
                    _local_4 = getWallItemIcon(_local_9, null, _local_7).data;
                    if (((_toolbar) && (_local_6)))
                    {
                        _toolbar.createTransitionToIcon("HTIE_ICON_INVENTORY", _local_4, _local_6.x, _local_6.y);
                    };
                };
            };
            disposeObject(_arg_1, _arg_2, 20);
            updateObjectRoomWindow(_arg_1, _arg_2, false);
            removeButtonMouseCursorOwner(_arg_1, 20, _arg_2);
        }

        public function addObjectUser(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Number, _arg_6:int, _arg_7:String=null):Boolean
        {
            var _local_9:* = null;
            var _local_8:* = null;
            if (getObjectUser(_arg_1, _arg_2) != null)
            {
                return (false);
            };
            var _local_10:String = RoomObjectUserTypes.getName(_arg_6);
            if (_local_10 == "pet")
            {
                _local_10 = getPetType(_arg_7);
            };
            var _local_11:IRoomObjectController = createObjectUser(_arg_1, _arg_2, _local_10);
            if (_local_11 == null)
            {
                return (false);
            };
            if (((!(_local_11 == null)) && (!(_local_11.getEventHandler() == null))))
            {
                _local_9 = new RoomObjectAvatarUpdateMessage(fixedUserLocation(_arg_1, _arg_3), null, _arg_4, _arg_5, false, 0);
                _local_11.getEventHandler().processUpdateMessage(_local_9);
                if (_arg_7 != null)
                {
                    _local_8 = new RoomObjectAvatarFigureUpdateMessage(_arg_7);
                    _local_11.getEventHandler().processUpdateMessage(_local_8);
                };
            };
            if (events != null)
            {
                events.dispatchEvent(new RoomEngineObjectEvent("REOE_ADDED", _arg_1, _arg_2, 100));
            };
            return (true);
        }

        public function addObjectSnowWar(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:int):Boolean
        {
            var _local_5:* = null;
            var _local_6:* = null;
            if (_arg_4 == 201)
            {
                _local_5 = "game_snowball";
            }
            else
            {
                if (_arg_4 == 202)
                {
                    _local_5 = "game_snowsplash";
                };
            };
            var _local_7:IRoomObjectController = createObjectSnowWar(_arg_1, _arg_2, _local_5, _arg_4);
            if (!_local_7)
            {
                return (false);
            };
            if (_local_7.getEventHandler())
            {
                _local_6 = new RoomObjectUpdateMessage(_arg_3, null);
                _local_7.getEventHandler().processUpdateMessage(_local_6);
            };
            return (true);
        }

        public function addObjectSnowSplash(_arg_1:int, _arg_2:int, _arg_3:IVector3d):Boolean
        {
            var _local_4:* = null;
            _roomManager.addObjectUpdateCategory(202);
            var _local_5:IRoomObjectController = createObjectSnowWar(_arg_1, _arg_2, "game_snowsplash", 202);
            if (!_local_5)
            {
                return (false);
            };
            if (_local_5.getEventHandler())
            {
                _local_4 = new RoomObjectUpdateMessage(_arg_3, null);
                _local_5.getEventHandler().processUpdateMessage(_local_4);
            };
            return (true);
        }

        public function updateObjectUser(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Boolean=false, _arg_6:Number=0, _arg_7:IVector3d=null, _arg_8:Number=NaN):Boolean
        {
            var _local_10:IRoomObjectController = getObjectUser(_arg_1, _arg_2);
            if ((((_local_10 == null) || (_local_10.getEventHandler() == null)) || (_local_10.getModel() == null)))
            {
                return (false);
            };
            if (_arg_3 == null)
            {
                _arg_3 = _local_10.getLocation();
            };
            if (_arg_7 == null)
            {
                _arg_7 = _local_10.getDirection();
            };
            if (isNaN(_arg_8))
            {
                _arg_8 = _local_10.getModel().getNumber("head_direction");
            };
            var _local_9:RoomObjectUpdateMessage = new RoomObjectAvatarUpdateMessage(fixedUserLocation(_arg_1, _arg_3), fixedUserLocation(_arg_1, _arg_4), _arg_7, _arg_8, _arg_5, _arg_6);
            _local_10.getEventHandler().processUpdateMessage(_local_9);
            if ((((roomSessionManager) && (roomSessionManager.getSession(_arg_1))) && (_arg_2 == roomSessionManager.getSession(_arg_1).ownUserRoomId)))
            {
                _roomObjectFactory.events.dispatchEvent(new RoomToObjectOwnAvatarMoveEvent("ROAME_MOVE_TO", _arg_4));
            };
            return (true);
        }

        public function updateObjectSnowWar(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:int):Boolean
        {
            var _local_5:IRoomObjectController = getObject(getRoomIdentifier(_arg_1), _arg_2, _arg_4);
            var _local_6:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(_arg_3, null);
            _local_5.getEventHandler().processUpdateMessage(_local_6);
            return (true);
        }

        public function disposeObjectSnowWar(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            disposeObject(_arg_1, _arg_2, _arg_3);
        }

        public function updateObjectUserFlatControl(_arg_1:int, _arg_2:int, _arg_3:String):Boolean
        {
            var _local_5:IRoomObjectController = getObjectUser(_arg_1, _arg_2);
            if (((_local_5 == null) || (_local_5.getEventHandler() == null)))
            {
                return (false);
            };
            var _local_4:RoomObjectUpdateStateMessage = new RoomObjectAvatarFlatControlUpdateMessage(_arg_3);
            _local_5.getEventHandler().processUpdateMessage(_local_4);
            return (true);
        }

        public function updateObjectUserOwnUserAvatar(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:IRoomObjectController = getObjectUser(_arg_1, _arg_2);
            if (((_local_3 == null) || (_local_3.getEventHandler() == null)))
            {
                return (false);
            };
            var _local_4:RoomObjectUpdateMessage = new RoomObjectAvatarOwnMessage();
            _local_3.getEventHandler().processUpdateMessage(_local_4);
            return (true);
        }

        public function updateObjectUserFigure(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:Boolean=false):Boolean
        {
            var _local_8:IRoomObjectController = getObjectUser(_arg_1, _arg_2);
            if (((_local_8 == null) || (_local_8.getEventHandler() == null)))
            {
                return (false);
            };
            var _local_7:RoomObjectUpdateStateMessage = new RoomObjectAvatarFigureUpdateMessage(_arg_3, _arg_4, _arg_5, _arg_6);
            _local_8.getEventHandler().processUpdateMessage(_local_7);
            return (true);
        }

        public function updateObjectUserAction(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String=null):Boolean
        {
            var _local_7:IRoomObjectController = getObjectUser(_arg_1, _arg_2);
            if (((_local_7 == null) || (_local_7.getEventHandler() == null)))
            {
                return (false);
            };
            var _local_6:RoomObjectUpdateStateMessage;
            switch (_arg_3)
            {
                case "figure_talk":
                    _local_6 = new RoomObjectAvatarChatUpdateMessage(_arg_4);
                    break;
                case "figure_sleep":
                    _local_6 = new RoomObjectAvatarSleepUpdateMessage((!(_arg_4 == 0)));
                    break;
                case "figure_is_typing":
                    _local_6 = new RoomObjectAvatarTypingUpdateMessage((!(_arg_4 == 0)));
                    break;
                case "figure_is_muted":
                    _local_6 = new RoomObjectAvatarMutedUpdateMessage((!(_arg_4 == 0)));
                    break;
                case "figure_carry_object":
                    _local_6 = new RoomObjectAvatarCarryObjectUpdateMessage(_arg_4, _arg_5);
                    break;
                case "figure_use_object":
                    _local_6 = new RoomObjectAvatarUseObjectUpdateMessage(_arg_4);
                    break;
                case "figure_dance":
                    _local_6 = new RoomObjectAvatarDanceUpdateMessage(_arg_4);
                    break;
                case "figure_gained_experience":
                    _local_6 = new RoomObjectAvatarExperienceUpdateMessage(_arg_4);
                    break;
                case "figure_number_value":
                    _local_6 = new RoomObjectAvatarPlayerValueUpdateMessage(_arg_4);
                    break;
                case "figure_sign":
                    _local_6 = new RoomObjectAvatarSignUpdateMessage(_arg_4);
                    break;
                case "figure_expression":
                    _local_6 = new RoomObjectAvatarExpressionUpdateMessage(_arg_4);
                    break;
                case "figure_is_playing_game":
                    _local_6 = new RoomObjectAvatarPlayingGameMessage((!(_arg_4 == 0)));
                    break;
                case "figure_guide_status":
                    _local_6 = new RoomObjectAvatarGuideStatusUpdateMessage(_arg_4);
            };
            _local_7.getEventHandler().processUpdateMessage(_local_6);
            return (true);
        }

        public function updateObjectUserPosture(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String=""):Boolean
        {
            var _local_6:IRoomObjectController = getObjectUser(_arg_1, _arg_2);
            if (((_local_6 == null) || (_local_6.getEventHandler() == null)))
            {
                return (false);
            };
            var _local_5:RoomObjectUpdateStateMessage = new RoomObjectAvatarPostureUpdateMessage(_arg_3, _arg_4);
            _local_6.getEventHandler().processUpdateMessage(_local_5);
            return (true);
        }

        public function updateObjectUserGesture(_arg_1:int, _arg_2:int, _arg_3:int):Boolean
        {
            var _local_5:IRoomObjectController = getObjectUser(_arg_1, _arg_2);
            if (((_local_5 == null) || (_local_5.getEventHandler() == null)))
            {
                return (false);
            };
            var _local_4:RoomObjectUpdateStateMessage = new RoomObjectAvatarGestureUpdateMessage(_arg_3);
            _local_5.getEventHandler().processUpdateMessage(_local_4);
            return (true);
        }

        public function updateObjectPetGesture(_arg_1:int, _arg_2:int, _arg_3:String):Boolean
        {
            var _local_5:IRoomObjectController = getObjectUser(_arg_1, _arg_2);
            if (((_local_5 == null) || (_local_5.getEventHandler() == null)))
            {
                return (false);
            };
            var _local_4:RoomObjectUpdateStateMessage = new RoomObjectAvatarPetGestureUpdateMessage(_arg_3);
            _local_5.getEventHandler().processUpdateMessage(_local_4);
            return (true);
        }

        public function updateObjectUserEffect(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=0):Boolean
        {
            var _local_5:IRoomObjectController = getObjectUser(_arg_1, _arg_2);
            if (((_local_5 == null) || (_local_5.getEventHandler() == null)))
            {
                return (false);
            };
            _local_5.getEventHandler().processUpdateMessage(new RoomObjectAvatarEffectUpdateMessage(_arg_3, _arg_4));
            return (true);
        }

        private function createObjectUser(_arg_1:int, _arg_2:int, _arg_3:String):IRoomObjectController
        {
            var _local_4:int = 100;
            var _local_5:IRoomObjectController = createObject(getRoomIdentifier(_arg_1), _arg_2, _arg_3, _local_4);
            return (_local_5);
        }

        private function createObjectSnowWar(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObjectController
        {
            return (createObject(getRoomIdentifier(_arg_1), _arg_2, _arg_3, _arg_4));
        }

        private function getObjectUser(_arg_1:int, _arg_2:int):IRoomObjectController
        {
            return (getObject(getRoomIdentifier(_arg_1), _arg_2, 100));
        }

        public function disposeObjectUser(_arg_1:int, _arg_2:int):void
        {
            disposeObject(_arg_1, _arg_2, 100);
        }

        private function createObject(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObjectController
        {
            var _local_5:IRoomInstance = _roomManager.getRoom(_arg_1);
            if (_local_5 == null)
            {
                return (null);
            };
            var _local_6:IRoomObjectController;
            _local_6 = (_local_5.createRoomObject(_arg_2, _arg_3, _arg_4) as IRoomObjectController);
            return (_local_6);
        }

        private function getObject(_arg_1:String, _arg_2:int, _arg_3:int):IRoomObjectController
        {
            var _local_4:IRoomInstance;
            if (_roomManager != null)
            {
                _local_4 = _roomManager.getRoom(_arg_1);
            };
            if (_local_4 == null)
            {
                return (null);
            };
            var _local_5:IRoomObjectController;
            _local_5 = (_local_4.getObject(_arg_2, _arg_3) as IRoomObjectController);
            if (_local_5 == null)
            {
                if (_arg_3 == 10)
                {
                    addObjectFurnitureFromData(getRoomId(_arg_1), _arg_2, null);
                    _local_5 = (_local_4.getObject(_arg_2, _arg_3) as IRoomObjectController);
                }
                else
                {
                    if (_arg_3 == 20)
                    {
                        addObjectWallItemFromData(getRoomId(_arg_1), _arg_2, null);
                        _local_5 = (_local_4.getObject(_arg_2, _arg_3) as IRoomObjectController);
                    };
                };
            };
            return (_local_5);
        }

        private function disposeObject(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_4:* = null;
            if (_roomManager != null)
            {
                _local_4 = getRoom(_arg_1);
                if (_local_4 == null)
                {
                    return;
                };
                if (_local_4.disposeObject(_arg_2, _arg_3))
                {
                    if (events != null)
                    {
                        events.dispatchEvent(new RoomEngineObjectEvent("REOE_REMOVED", _arg_1, _arg_2, _arg_3));
                    };
                };
            };
        }

        private function roomObjectEventHandler(_arg_1:RoomObjectEvent):void
        {
            var _local_2:* = null;
            var _local_3:int;
            if (_SafeStr_3700 != null)
            {
                _local_2 = getRoomObjectRoomIdentifier(_arg_1.object);
                if (_local_2 != null)
                {
                    _local_3 = getRoomId(_local_2);
                    _SafeStr_3700.handleRoomObjectEvent(_arg_1, _local_3);
                };
            };
        }

        private function getRoomObjectRoomIdentifier(_arg_1:IRoomObject):String
        {
            if (((!(_arg_1 == null)) && (!(_arg_1.getModel() == null))))
            {
                return (_arg_1.getModel().getString("object_room_id"));
            };
            return (null);
        }

        public function createScreenShot(_arg_1:int, _arg_2:int, _arg_3:String):void
        {
            var _local_10:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_4:RegExp = /[:\/\\\*\?"<>\|%]/g;
            _arg_3 = _arg_3.replace(_local_4, "");
            var _local_9:IRoomRenderingCanvas = getRoomCanvas(_arg_1, _arg_2);
            if (!_local_9)
            {
                return;
            };
            var _local_8:BitmapData = _local_9.takeScreenShot();
            if (_SafeStr_3235.isVersionAtLeast(11, 3))
            {
            };
            if (_local_10 == null)
            {
                _local_10 = _SafeStr_3128.encode(_local_8);
            };
            try
            {
                _local_7 = new FileReference();
                _local_7.save(_local_10, _arg_3);
            }
            catch(error:Error)
            {
                _local_5 = new Date();
                _local_6 = (([_local_5.getFullYear(), _local_5.getMonth(), _local_5.getDate()].join("-") + " ") + [_local_5.getHours(), _local_5.getMinutes(), _local_5.getSeconds()].join("."));
                _arg_3 = ("Habbo " + _local_6);
                _local_7 = new FileReference();
                _local_7.save(_local_10, _arg_3);
            };
        }

        public function getFurnitureIconUrl(_arg_1:int):String
        {
            var _local_3:String;
            var _local_2:String = "";
            if (_SafeStr_3701 != null)
            {
                _local_3 = _SafeStr_3701.getActiveObjectType(_arg_1);
                _local_2 = String(_SafeStr_3701.getActiveObjectColorIndex(_arg_1));
            };
            return (_SafeStr_3701.getObjectUrl(_local_3, _local_2));
        }

        public function getFurnitureIcon(_arg_1:int, _arg_2:_SafeStr_3140, _arg_3:String=null, _arg_4:IStuffData=null, _arg_5:Boolean=false):_SafeStr_3248
        {
            return (getFurnitureImage(_arg_1, new Vector3d(), 1, _arg_2, 0, _arg_3, -1, -1, _arg_4, _arg_5));
        }

        public function getWallItemIconUrl(_arg_1:int, _arg_2:String=null):String
        {
            var _local_4:String;
            var _local_3:String = "";
            if (_SafeStr_3701 != null)
            {
                _local_4 = _SafeStr_3701.getWallItemType(_arg_1, _arg_2);
                _local_3 = String(_SafeStr_3701.getWallItemColorIndex(_arg_1));
            };
            return (_SafeStr_3701.getObjectUrl(_local_4, _local_3));
        }

        public function getWallItemIcon(_arg_1:int, _arg_2:_SafeStr_3140, _arg_3:String=null):_SafeStr_3248
        {
            return (getWallItemImage(_arg_1, new Vector3d(), 1, _arg_2, 0, _arg_3));
        }

        public function getFurnitureImage(_arg_1:int, _arg_2:IVector3d, _arg_3:int, _arg_4:_SafeStr_3140, _arg_5:uint=0, _arg_6:String=null, _arg_7:int=-1, _arg_8:int=-1, _arg_9:IStuffData=null, _arg_10:Boolean=false):_SafeStr_3248
        {
            var _local_12:String;
            var _local_11:String = "";
            if (_SafeStr_3701 != null)
            {
                _local_12 = _SafeStr_3701.getActiveObjectType(_arg_1);
                _local_11 = String(_SafeStr_3701.getActiveObjectColorIndex(_arg_1));
            };
            if ((((_arg_3 == 1) && (!(_arg_4 == null))) && (!(_arg_10))))
            {
                return (getGenericRoomObjectThumbnail(_local_12, _local_11, _arg_4, _arg_6, _arg_9));
            };
            return (getGenericRoomObjectImage(_local_12, _local_11, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_9, _arg_7, _arg_8));
        }

        public function getPetImage(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:int, _arg_6:_SafeStr_3140, _arg_7:Boolean=true, _arg_8:uint=0, _arg_9:Array=null, _arg_10:String=null):_SafeStr_3248
        {
            var _local_11:String;
            var _local_13:String = ((((_arg_1 + " ") + _arg_2) + " ") + _arg_3.toString(16));
            if (!_arg_7)
            {
                _local_13 = (_local_13 + " head");
            };
            if (_arg_9 != null)
            {
                _local_13 = (_local_13 + (" " + _arg_9.length));
                for each (var _local_12:PetCustomPart in _arg_9)
                {
                    _local_13 = (_local_13 + (((((" " + _local_12.layerId) + " ") + _local_12.partId) + " ") + _local_12.paletteId));
                };
            };
            if (_SafeStr_3701 != null)
            {
                _local_11 = _SafeStr_3701.getPetType(_arg_1);
            };
            return (getGenericRoomObjectImage(_local_11, _local_13, _arg_4, _arg_5, _arg_6, _arg_8, null, null, -1, -1, _arg_10));
        }

        public function getWallItemImage(_arg_1:int, _arg_2:IVector3d, _arg_3:int, _arg_4:_SafeStr_3140, _arg_5:uint=0, _arg_6:String=null, _arg_7:int=-1, _arg_8:int=-1):_SafeStr_3248
        {
            var _local_10:String;
            var _local_9:String = "";
            if (_SafeStr_3701 != null)
            {
                _local_10 = _SafeStr_3701.getWallItemType(_arg_1, _arg_6);
                _local_9 = String(_SafeStr_3701.getWallItemColorIndex(_arg_1));
            };
            if (((_arg_3 == 1) && (!(_arg_4 == null))))
            {
                return (getGenericRoomObjectThumbnail(_local_10, _local_9, _arg_4, _arg_6, null));
            };
            return (getGenericRoomObjectImage(_local_10, _local_9, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, null, _arg_7, _arg_8));
        }

        public function getRoomImage(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:_SafeStr_3140, _arg_6:String=null):_SafeStr_3248
        {
            if (_arg_1 == null)
            {
                _arg_1 = "";
            };
            if (_arg_2 == null)
            {
                _arg_2 = "";
            };
            if (_arg_3 == null)
            {
                _arg_3 = "";
            };
            var _local_8:String = "room";
            var _local_7:String = (((((_arg_1 + "\n") + _arg_2) + "\n") + _arg_3) + "\n");
            if (_arg_6 != null)
            {
                _local_7 = (_local_7 + _arg_6);
            };
            return (getGenericRoomObjectImage(_local_8, _local_7, new Vector3d(), _arg_4, _arg_5));
        }

        public function getRoomObjectImage(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:int, _arg_6:_SafeStr_3140, _arg_7:uint=0):_SafeStr_3248
        {
            var _local_9:* = null;
            var _local_16:* = null;
            var _local_8:int;
            var _local_10:String;
            var _local_13:String = "";
            var _local_14:IStuffData;
            var _local_15:int = -1;
            var _local_12:String = getRoomIdentifier(_arg_1);
            var _local_11:IRoomInstance = _roomManager.getRoom(_local_12);
            if (_local_11 != null)
            {
                _local_16 = _local_11.getObject(_arg_2, _arg_3);
                if (((!(_local_16 == null)) && (!(_local_16.getModel() == null))))
                {
                    _local_10 = _local_16.getType();
                    _local_15 = _local_16.getId();
                    switch (_arg_3)
                    {
                        case 10:
                        case 20:
                            _local_13 = String(_local_16.getModel().getNumber("furniture_color"));
                            _local_9 = _local_16.getModel().getString("furniture_extras");
                            _local_8 = _local_16.getModel().getNumber("furniture_data_format");
                            if (_local_8 != 0)
                            {
                                _local_14 = _SafeStr_1588.getStuffDataWrapperForType(_local_8);
                                _local_14.initializeFromRoomObjectModel(_local_16.getModel());
                            };
                            break;
                        case 100:
                            _local_13 = _local_16.getModel().getString("figure");
                    };
                };
            };
            return (getGenericRoomObjectImage(_local_10, _local_13, _arg_4, _arg_5, _arg_6, _arg_7, _local_9, _local_14, -1, -1, null, _local_15));
        }

        private function initializeRoomForGettingImage(_arg_1:IRoomObjectController, _arg_2:String):void
        {
            var _local_3:* = null;
            var _local_8:* = null;
            var _local_9:* = null;
            var _local_12:* = null;
            var _local_4:* = null;
            var _local_11:int;
            var _local_5:* = null;
            var _local_14:int;
            var _local_13:int;
            var _local_6:* = null;
            var _local_7:* = null;
            var _local_10:* = null;
            if (_arg_2 != null)
            {
                _local_3 = _arg_2.split("\n");
                if (_local_3.length >= 3)
                {
                    _local_8 = _local_3[0];
                    _local_9 = _local_3[1];
                    _local_12 = _local_3[2];
                    _local_4 = _local_3[3];
                    _local_11 = 6;
                    _local_5 = new RoomPlaneParser();
                    _local_5.initializeTileMap((_local_11 + 2), (_local_11 + 2));
                    _local_14 = 1;
                    while (_local_14 < (1 + _local_11))
                    {
                        _local_13 = 1;
                        while (_local_13 < (1 + _local_11))
                        {
                            _local_5.setTileHeight(_local_13, _local_14, 0);
                            _local_13++;
                        };
                        _local_14++;
                    };
                    _local_5.wallHeight = _local_11;
                    _local_5.initializeFromTileData();
                    _local_6 = _local_5.getXML();
                    _arg_1.getEventHandler().initialize(_local_6);
                    _arg_1.getModelController().setString("room_floor_type", _local_8);
                    _arg_1.getModelController().setString("room_wall_type", _local_9);
                    _arg_1.getModelController().setString("room_landscape_type", _local_12);
                    if (_local_4 != null)
                    {
                        _local_7 = null;
                        _local_10 = "20_1";
                        _local_7 = new RoomObjectRoomMaskUpdateMessage("RORMUM_ADD_MASK", _local_10, _local_4, new Vector3d(2.5, 0.5, 2));
                        _arg_1.getEventHandler().processUpdateMessage(_local_7);
                    };
                    _local_5.dispose();
                };
            };
        }

        public function getGenericRoomObjectThumbnail(_arg_1:String, _arg_2:String, _arg_3:_SafeStr_3140, _arg_4:String=null, _arg_5:IStuffData=null):_SafeStr_3248
        {
            var _local_9:*;
            var _local_13:* = null;
            var _local_8:* = null;
            var _local_7:_SafeStr_3248 = new _SafeStr_3248();
            _local_7.id = -1;
            if (((!(_SafeStr_3698)) || (_arg_1 == null)))
            {
                return (_local_7);
            };
            var _local_6:IRoomInstance = _roomManager.getRoom("temporary_room");
            if (_local_6 == null)
            {
                _local_6 = _roomManager.createRoom("temporary_room", null);
                if (_local_6 == null)
                {
                    return (_local_7);
                };
            };
            var _local_11:int = _SafeStr_3704.reserveNumber();
            var _local_12:int = getRoomObjectCategory(_arg_1);
            if (_local_11 < 0)
            {
                return (_local_7);
            };
            _local_11 = (_local_11 + 1);
            _local_7.id = _local_11;
            _local_7.data = null;
            var _local_10:String = [_arg_1, _arg_2].join("_");
            if (((!(assets.hasAsset(_local_10))) && (!(_arg_3 == null))))
            {
                _local_9 = _SafeStr_3706.getValue(_local_10);
                if (_local_9 == null)
                {
                    _local_9 = new Vector.<_SafeStr_3140>(0);
                    _SafeStr_3706.add(_local_10, _local_9);
                    _SafeStr_3701.loadThumbnailContent(_local_11, _arg_1, _arg_2, null);
                };
                _local_9.push(_arg_3);
            }
            else
            {
                _local_13 = (assets.getAssetByName(_local_10) as BitmapDataAsset);
                if (((_local_13) && (!(_local_13.disposed))))
                {
                    _local_8 = (_local_13.content as BitmapData);
                    try
                    {
                        if (((((!(_local_8 == null)) && (_local_8 is BitmapData)) && (_local_8.width > 0)) && (_local_8.height > 0)))
                        {
                            _local_7.data = _local_8.clone();
                        }
                        else
                        {
                            _SafeStr_14.log(("Could not process thumbnail for icon (disposed?): " + _local_10));
                        };
                    }
                    catch(error:Error)
                    {
                        _SafeStr_14.log(("Could not process thumbnail for icon: " + _local_10));
                    };
                };
                _SafeStr_3704.freeNumber((_local_11 - 1));
                _local_7.id = 0;
            };
            return (_local_7);
        }

        public function getGenericRoomObjectImage(_arg_1:String, _arg_2:String, _arg_3:IVector3d, _arg_4:int, _arg_5:_SafeStr_3140, _arg_6:uint=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, _arg_10:int=-1, _arg_11:String=null, _arg_12:int=-1):_SafeStr_3248
        {
            var _local_18:* = null;
            var _local_23:* = null;
            var _local_15:int;
            var _local_17:_SafeStr_3248 = new _SafeStr_3248();
            _local_17.id = -1;
            if (((!(_SafeStr_3698)) || (_arg_1 == null)))
            {
                return (_local_17);
            };
            var _local_16:IRoomInstance = _roomManager.getRoom("temporary_room");
            if (_local_16 == null)
            {
                _local_16 = _roomManager.createRoom("temporary_room", null);
                if (_local_16 == null)
                {
                    return (_local_17);
                };
            };
            var _local_21:int = _SafeStr_3703.reserveNumber();
            var _local_22:int = getRoomObjectCategory(_arg_1);
            if (_local_21 < 0)
            {
                return (_local_17);
            };
            _local_21 = (_local_21 + 1);
            var _local_24:IRoomObjectController = (_local_16.createRoomObject(_local_21, _arg_1, _local_22) as IRoomObjectController);
            if ((((_local_24 == null) || (_local_24.getModelController() == null)) || (_local_24.getEventHandler() == null)))
            {
                return (_local_17);
            };
            var _local_13:IRoomObjectModelController = _local_24.getModelController();
            switch (_local_22)
            {
                case 10:
                case 20:
                    _local_13.setNumber("furniture_color", int(_arg_2));
                    _local_13.setString("furniture_extras", _arg_7);
                    break;
                case 100:
                    if (((((_arg_1 == "user") || (_arg_1 == "bot")) || (_arg_1 == "rentable_bot")) || (_arg_1 == "pet")))
                    {
                        _local_13.setString("figure", _arg_2);
                    }
                    else
                    {
                        _local_18 = new PetFigureData(_arg_2);
                        _local_13.setNumber("pet_palette_index", _local_18.paletteId);
                        _local_13.setNumber("pet_color", _local_18.color);
                        if (_local_18.headOnly)
                        {
                            _local_13.setNumber("pet_head_only", 1);
                        };
                        if (_local_18.hasCustomParts)
                        {
                            _local_13.setNumberArray("pet_custom_layer_ids", _local_18.customLayerIds);
                            _local_13.setNumberArray("pet_custom_part_ids", _local_18.customPartIds);
                            _local_13.setNumberArray("pet_custom_palette_ids", _local_18.customPaletteIds);
                        };
                        if (_arg_11 != null)
                        {
                            _local_13.setString("figure_posture", _arg_11);
                        };
                    };
                    break;
                case 0:
                    initializeRoomForGettingImage(_local_24, _arg_2);
            };
            _local_24.setDirection(_arg_3);
            var _local_14:IRoomObjectSpriteVisualization;
            _local_14 = (_local_24.getVisualization() as IRoomObjectSpriteVisualization);
            if (_local_14 == null)
            {
                _local_16.disposeObject(_local_21, _local_22);
                return (_local_17);
            };
            if (((_arg_9 > -1) || (_arg_8)))
            {
                if (((!(_arg_8 == null)) && (!(_arg_8.getLegacyString() == ""))))
                {
                    _local_23 = new RoomObjectDataUpdateMessage(_arg_8.getLegacyString(), _arg_8);
                }
                else
                {
                    _local_23 = new RoomObjectDataUpdateMessage(_arg_9, _arg_8);
                };
                if (_local_24.getEventHandler() != null)
                {
                    _local_24.getEventHandler().processUpdateMessage(_local_23);
                };
            };
            var _local_20:RoomGeometry = new RoomGeometry(_arg_4, new Vector3d(-135, 30, 0), new Vector3d(11, 11, 5));
            _local_14.update(_local_20, 0, true, false);
            if (_arg_10 > 0)
            {
                _local_15 = 0;
                while (_local_15 < _arg_10)
                {
                    _local_14.update(_local_20, 0, true, false);
                    _local_15++;
                };
            };
            var _local_19:BitmapData = _local_14.getImage(_arg_6, _arg_12);
            _local_17.data = _local_19;
            _local_17.id = _local_21;
            if (((!(isRoomObjectContentAvailable(_arg_1))) && (!(_arg_5 == null))))
            {
                _SafeStr_3705.add(_local_21, _arg_5);
                _local_13.setNumber("image_query_scale", _arg_4, true);
            }
            else
            {
                _local_16.disposeObject(_local_21, _local_22);
                _SafeStr_3703.freeNumber((_local_21 - 1));
                _local_17.id = 0;
            };
            _local_20.dispose();
            return (_local_17);
        }

        public function getRoomObjectBoundingRectangle(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):Rectangle
        {
            var _local_11:* = null;
            var _local_6:* = null;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_9:Number;
            var _local_8:* = null;
            var _local_10:IRoomGeometry = getRoomCanvasGeometry(_arg_1, _arg_4);
            if (_local_10 != null)
            {
                _local_11 = getRoomObject(_arg_1, _arg_2, _arg_3);
                if (_local_11 != null)
                {
                    _local_6 = _local_11.getVisualization();
                    if (_local_6 != null)
                    {
                        _local_5 = _local_6.boundingRectangle;
                        _local_7 = getRoomCanvas(_arg_1, _arg_4);
                        _local_9 = ((_local_7) ? _local_7.scale : 1);
                        _local_8 = _local_10.getScreenPoint(_local_11.getLocation());
                        if (_local_8 != null)
                        {
                            _local_5.left = (_local_5.left * _local_9);
                            _local_5.top = (_local_5.top * _local_9);
                            _local_5.width = (_local_5.width * _local_9);
                            _local_5.height = (_local_5.height * _local_9);
                            _local_8.x = (_local_8.x * _local_9);
                            _local_8.y = (_local_8.y * _local_9);
                            _local_5.offset(_local_8.x, _local_8.y);
                            if (_local_7 != null)
                            {
                                _local_5.offset(((_local_7.width / 2) + _local_7.screenOffsetX), ((_local_7.height / 2) + _local_7.screenOffsetY));
                                return (_local_5);
                            };
                        };
                    };
                };
            };
            return (null);
        }

        public function getRoomObjectScreenLocation(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=-1):Point
        {
            var _local_8:* = null;
            var _local_6:* = null;
            var _local_5:* = null;
            if (_arg_4 == -1)
            {
                _arg_4 = _SafeStr_3714;
            };
            var _local_7:IRoomGeometry = getRoomCanvasGeometry(_arg_1, _arg_4);
            if (_local_7 != null)
            {
                _local_8 = getRoomObject(_arg_1, _arg_2, _arg_3);
                if (_local_8 != null)
                {
                    _local_6 = _local_7.getScreenPoint(_local_8.getLocation());
                    if (_local_6 != null)
                    {
                        _local_5 = getRoomCanvas(_arg_1, _arg_4);
                        if (_local_5 != null)
                        {
                            _local_6.x = (_local_6.x * _local_5.scale);
                            _local_6.y = (_local_6.y * _local_5.scale);
                            _local_6.offset(((_local_5.width / 2) + _local_5.screenOffsetX), ((_local_5.height / 2) + _local_5.screenOffsetY));
                        };
                        return (_local_6);
                    };
                };
            };
            return (null);
        }

        public function getActiveRoomBoundingRectangle(_arg_1:int):Rectangle
        {
            return (getRoomObjectBoundingRectangle(_SafeStr_3699, -1, 0, _arg_1));
        }

        public function getActiveRoomActiveCanvas():IRoomRenderingCanvas
        {
            return (getRoomCanvas(_SafeStr_3699, _SafeStr_3714));
        }

        public function isRoomObjectContentAvailable(_arg_1:String):Boolean
        {
            return (_roomManager.isContentAvailable(_arg_1));
        }

        public function iconLoaded(_arg_1:int, _arg_2:String, _arg_3:Boolean):void
        {
            var _local_7:* = null;
            var _local_4:* = null;
            if (_SafeStr_3701 == null)
            {
                return;
            };
            if (_arg_1 == -1)
            {
                return;
            };
            _SafeStr_3704.freeNumber((_arg_1 - 1));
            var _local_5:Vector.<_SafeStr_3140> = _SafeStr_3706.getValue(_arg_2);
            if (_local_5 != null)
            {
                _SafeStr_3706.remove(_arg_2);
                _local_7 = (assets.getAssetByName(_arg_2) as BitmapDataAsset);
                _local_4 = (_local_7.content as BitmapData);
                if (((_local_7) && (!(_local_7.disposed))))
                {
                    for each (var _local_6:_SafeStr_3140 in _local_5)
                    {
                        if (_local_6 != null)
                        {
                            try
                            {
                                if (((((!(_local_4 == null)) && (_local_4 is BitmapData)) && (_local_4.width > 0)) && (_local_4.height > 0)))
                                {
                                    _local_6.imageReady(_arg_1, _local_4.clone());
                                }
                                else
                                {
                                    _SafeStr_14.log(("Could not load thumbnail for icon (disposed?): " + _arg_2));
                                };
                            }
                            catch(error:Error)
                            {
                                _SafeStr_14.log(("Could not load thumbnail for icon: " + _arg_2));
                            };
                        };
                    };
                };
            };
        }

        public function contentLoaded(_arg_1:String, _arg_2:Boolean):void
        {
            var _local_6:int;
            var _local_14:* = null;
            var _local_11:int;
            var _local_9:* = null;
            var _local_4:* = null;
            var _local_7:Number;
            var _local_5:* = null;
            if (!_arg_2)
            {
                _SafeStr_14.log(("[RoomEngine] Failed to load content:  " + _arg_1));
            };
            var _local_8:IRoomInstance = _roomManager.getRoom("temporary_room");
            if (_local_8 == null)
            {
                _SafeStr_14.log(((("No room instance for " + _arg_1) + " room: ") + "temporary_room"));
                return;
            };
            if (_SafeStr_3701 == null)
            {
                return;
            };
            var _local_10:RoomGeometry;
            var _local_13:* = 0;
            var _local_12:int = _SafeStr_3701.getObjectCategory(_arg_1);
            var _local_3:int = _local_8.getObjectCount(_local_12);
            _local_6 = (_local_3 - 1);
            while (_local_6 >= 0)
            {
                _local_14 = _local_8.getObjectWithIndex(_local_6, _local_12);
                if ((((!(_local_14 == null)) && (!(_local_14.getModel() == null))) && (_local_14.getType() == _arg_1)))
                {
                    _local_11 = _local_14.getId();
                    _local_9 = null;
                    _local_4 = null;
                    _local_4 = (_local_14.getVisualization() as IRoomObjectSpriteVisualization);
                    if (_local_4 != null)
                    {
                        _local_7 = _local_14.getModel().getNumber("image_query_scale");
                        if (((!(_local_10 == null)) && (!(_local_13 == _local_7))))
                        {
                            _local_10.dispose();
                            _local_10 = null;
                        };
                        if (_local_10 == null)
                        {
                            _local_13 = _local_7;
                            _local_10 = new RoomGeometry(_local_7, new Vector3d(-135, 30, 0), new Vector3d(11, 11, 5));
                        };
                        _local_4.update(_local_10, 0, true, false);
                        _local_9 = _local_4.image;
                    };
                    _local_8.disposeObject(_local_11, _local_12);
                    _SafeStr_3703.freeNumber((_local_11 - 1));
                    _local_5 = (_SafeStr_3705.remove(String(_local_11)) as _SafeStr_3140);
                    if (_local_5 != null)
                    {
                        if (_local_9 != null)
                        {
                            _local_5.imageReady(_local_11, _local_9);
                        }
                        else
                        {
                            _local_5.imageFailed(_local_11);
                        };
                    }
                    else
                    {
                        if (_local_9 != null)
                        {
                            _local_9.dispose();
                        };
                    };
                };
                _local_6--;
            };
            if (_local_10 != null)
            {
                _local_10.dispose();
            };
        }

        public function objectInitialized(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
            var _local_5:int;
            var _local_4:* = null;
            var _local_6:int;
            var _local_7:* = null;
            var _local_8:int = getRoomId(_arg_1);
            if (_arg_3 == 20)
            {
                updateObjectRoomWindow(_local_8, _arg_2);
            };
            var _local_9:IRoomObjectController = (getRoomObject(_local_8, _arg_2, _arg_3) as IRoomObjectController);
            if ((((!(_local_9 == null)) && (!(_local_9.getModel() == null))) && (!(_local_9.getEventHandler() == null))))
            {
                if (!isNaN(_local_9.getModel().getNumber("furniture_data_format")))
                {
                    _local_5 = _local_9.getModel().getNumber("furniture_data_format");
                    _local_4 = _SafeStr_1588.getStuffDataWrapperForType(_local_5);
                    _local_4.initializeFromRoomObjectModel(_local_9.getModel());
                    _local_6 = _local_9.getState(0);
                    _local_7 = new RoomObjectDataUpdateMessage(_local_6, _local_4);
                    _local_9.getEventHandler().processUpdateMessage(_local_7);
                };
                if (events != null)
                {
                    events.dispatchEvent(new RoomEngineObjectEvent("REOE_CONTENT_UPDATED", _local_8, _arg_2, _arg_3));
                };
            };
            if (_arg_1 != "temporary_room")
            {
                addObjectToTileMap(_local_8, _local_9);
            };
        }

        public function objectsInitialized(_arg_1:String):void
        {
            var _local_2:int;
            if (events != null)
            {
                _local_2 = getRoomId(_arg_1);
                events.dispatchEvent(new RoomEngineEvent("REE_OBJECTS_INITIALIZED", _local_2));
            };
        }

        public function selectAvatar(_arg_1:int, _arg_2:int):void
        {
            if (_SafeStr_3700 != null)
            {
                _SafeStr_3700.setSelectedAvatar(_arg_1, _arg_2, true);
            };
        }

        public function getSelectedAvatarId():int
        {
            if (_SafeStr_3700 != null)
            {
                return (_SafeStr_3700.getSelectedAvatarId());
            };
            return (-1);
        }

        public function selectRoomObject(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            if (_SafeStr_3700 == null)
            {
                return;
            };
            _SafeStr_3700.setSelectedObject(_arg_1, _arg_2, _arg_3);
        }

        protected function addObjectToTileMap(_arg_1:int, _arg_2:IRoomObject):void
        {
            var _local_3:_SafeStr_3262 = getRoomInstanceData(_arg_1).tileObjectMap;
            if (_local_3)
            {
                _local_3.addRoomObject(_arg_2);
            };
        }

        public function refreshTileObjectMap(_arg_1:int, _arg_2:String):void
        {
            var _local_3:_SafeStr_3262 = getRoomInstanceData(_arg_1).tileObjectMap;
            if (_local_3)
            {
                _local_3.populate(getRoomObjects(_arg_1, 10));
            };
        }

        private function showRoomAd(_arg_1:AdEvent):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (_SafeStr_3701 != null)
            {
                _local_3 = getObjectRoom(_arg_1.roomId);
                if (_local_3 == null)
                {
                    return;
                };
                _local_2 = null;
                _local_2 = new RoomObjectRoomAdUpdateMessage("RORUM_ROOM_AD_ACTIVATE", "room_ad_image_asset", _arg_1.clickUrl);
                _local_3.getEventHandler().processUpdateMessage(_local_2);
            };
        }

        public function requestRoomAdImage(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String):void
        {
            if (_adManager != null)
            {
                _adManager.loadRoomAdImage(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            };
        }

        private function onRoomAdImageLoaded(_arg_1:AdEvent):void
        {
            var _local_2:* = null;
            var _local_3:IRoomObjectController = getObjectRoom(_arg_1.roomId);
            if (_local_3 == null)
            {
                return;
            };
            var _local_4:IRoomObjectController = getObjectFurniture(_arg_1.roomId, _arg_1.objectId);
            if (((_local_4 == null) || (_local_4.getEventHandler() == null)))
            {
                return;
            };
            if (_arg_1.image != null)
            {
                _SafeStr_3701.addGraphicAsset(_local_4.getType(), _arg_1.imageUrl, _arg_1.image, true);
            };
            switch (_arg_1.type)
            {
                case "AE_ROOM_AD_IMAGE_LOADED":
                    _local_2 = new RoomObjectRoomAdUpdateMessage("RORUM_ROOM_BILLBOARD_IMAGE_LOADED", _arg_1.imageUrl, _arg_1.clickUrl, _arg_1.objectId, _arg_1.image);
                    break;
                case "AE_ROOM_AD_IMAGE_LOADING_FAILED":
                    _local_2 = new RoomObjectRoomAdUpdateMessage("RORUM_ROOM_BILLBOARD_IMAGE_LOADING_FAILED", _arg_1.imageUrl, _arg_1.clickUrl, _arg_1.objectId, _arg_1.image);
                    break;
                default:
            };
            if (_local_2 != null)
            {
                _local_4.getEventHandler().processUpdateMessage(_local_2);
            };
        }

        public function insertContentLibrary(_arg_1:int, _arg_2:int, _arg_3:_SafeStr_21):Boolean
        {
            return (_SafeStr_3701.insertObjectContent(_arg_1, _arg_2, _arg_3));
        }

        public function setActiveObjectType(_arg_1:int, _arg_2:String):void
        {
            _SafeStr_3701.setActiveObjectType(_arg_1, _arg_2);
        }

        override public function purge():void
        {
            super.purge();
            if (_SafeStr_3701)
            {
                _SafeStr_3701.purge();
            };
        }

        public function requestBadgeImageAsset(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean=true):void
        {
            var _local_10:* = null;
            var _local_6:* = null;
            var _local_11:IRoomObjectController;
            if (_arg_1 == 0)
            {
                _local_10 = _roomManager.getRoom("temporary_room");
                if (_local_10 != null)
                {
                    _local_11 = (_local_10.getObject(_arg_2, _arg_3) as IRoomObjectController);
                };
            }
            else
            {
                _local_11 = getObjectFurniture(_arg_1, _arg_2);
            };
            if (((_local_11 == null) || (_local_11.getEventHandler() == null)))
            {
                return;
            };
            var _local_8:Function = ((_arg_5) ? _sessionDataManager.getGroupBadgeAssetName : _sessionDataManager.getBadgeImageAssetName);
            var _local_7:String = _local_8.call(null, _arg_4);
            if (!_local_7)
            {
                _local_7 = "loading_icon";
                if (!_SafeStr_3709)
                {
                    _SafeStr_3709 = new _SafeStr_24();
                };
                if (_SafeStr_3709.length == 0)
                {
                    _sessionDataManager.events.addEventListener("BIRE_BADGE_IMAGE_READY", onBadgeLoaded);
                };
                _local_6 = _SafeStr_3709.getValue(_arg_4);
                if (_local_6 == null)
                {
                    _local_6 = [];
                };
                _local_6.push(new _SafeStr_3222(_local_11, _arg_5));
                _SafeStr_3709[_arg_4] = _local_6;
            }
            else
            {
                addBadgeGraphicAssets(_local_11, _arg_4, _arg_5);
            };
            var _local_9:RoomObjectGroupBadgeUpdateMessage = new RoomObjectGroupBadgeUpdateMessage(_arg_4, _local_7);
            if (_local_9 != null)
            {
                _local_11.getEventHandler().processUpdateMessage(_local_9);
            };
        }

        private function addBadgeGraphicAssets(_arg_1:IRoomObjectController, _arg_2:String, _arg_3:Boolean=false):void
        {
            var _local_9:Function = ((_arg_3) ? _sessionDataManager.getGroupBadgeAssetName : _sessionDataManager.getBadgeImageAssetName);
            var _local_10:Function = ((_arg_3) ? _sessionDataManager.getGroupBadgeSmallAssetName : _sessionDataManager.getBadgeImageSmallAssetName);
            var _local_11:Function = ((_arg_3) ? _sessionDataManager.getGroupBadgeImage : _sessionDataManager.getBadgeImage);
            var _local_8:Function = ((_arg_3) ? _sessionDataManager.getGroupBadgeSmallImage : _sessionDataManager.getBadgeSmallImage);
            var _local_7:String = String(_local_9.call(null, _arg_2));
            var _local_4:BitmapData = BitmapData(_local_11.call(null, _arg_2));
            _SafeStr_3701.addGraphicAsset(_arg_1.getType(), _local_7, _local_4, false);
            var _local_5:String = String(_local_10.call(null, _arg_2));
            var _local_6:BitmapData = _local_8.call(null, _arg_2);
            if (_local_6)
            {
                _SafeStr_3701.addGraphicAsset(_arg_1.getType(), _local_5, _local_6, false);
            };
        }

        private function onBadgeLoaded(_arg_1:BadgeImageReadyEvent):void
        {
            var _local_4:int;
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_2:Array = (_SafeStr_3709.getValue(_arg_1.badgeId) as Array);
            if (_local_2 == null)
            {
                _SafeStr_14.log(("Could not find matching objects for group badge asset request " + _arg_1.badgeId));
                return;
            };
            _local_4 = 0;
            while (_local_4 < _local_2.length)
            {
                _local_3 = _local_2[_local_4];
                addBadgeGraphicAssets(_local_3.object, _arg_1.badgeId, _local_3.groupBadge);
                _local_5 = ((_local_3.groupBadge) ? _sessionDataManager.getGroupBadgeAssetName : _sessionDataManager.getBadgeImageAssetName);
                _local_6 = new RoomObjectGroupBadgeUpdateMessage(_arg_1.badgeId, _local_5.call(null, _arg_1.badgeId));
                if (((!(_local_6 == null)) && (!(_local_3.object.getEventHandler() == null))))
                {
                    _local_3.object.getEventHandler().processUpdateMessage(_local_6);
                };
                _local_4++;
            };
            _SafeStr_3709.remove(_arg_1.badgeId);
            if (_SafeStr_3709.length == 0)
            {
                _sessionDataManager.events.removeEventListener("BIRE_BADGE_IMAGE_READY", onBadgeLoaded);
            };
        }

        public function get isDecorateMode():Boolean
        {
            if (!_roomSessionManager)
            {
                return (false);
            };
            var _local_1:IRoomSession = _roomSessionManager.getSession(_SafeStr_3699);
            return ((_local_1) && (_local_1.isUserDecorating));
        }

        public function get isGameMode():Boolean
        {
            return (_SafeStr_3710);
        }

        public function set isGameMode(_arg_1:Boolean):void
        {
            _SafeStr_3710 = _arg_1;
        }

        public function showUseProductSelection(_arg_1:int, _arg_2:int, _arg_3:int=-1):void
        {
            var _local_5:int;
            var _local_4:String;
            if (_SafeStr_3701 != null)
            {
                _local_4 = _SafeStr_3701.getActiveObjectType(_arg_2);
                _local_5 = getRoomObjectCategory(_local_4);
                events.dispatchEvent(new RoomEngineUseProductEvent("ROSM_USE_PRODUCT_FROM_INVENTORY", _SafeStr_3699, _arg_3, _local_5, _arg_1, _arg_2));
            };
        }

        public function setAvatarEffect(_arg_1:int):void
        {
            if (((_sessionDataManager == null) || (_roomSessionManager == null)))
            {
                return;
            };
            var _local_2:IRoomSession = _roomSessionManager.getSession(_SafeStr_3699);
            if (_local_2 == null)
            {
                return;
            };
            updateObjectUserEffect(activeRoomId, _local_2.ownUserRoomId, _arg_1);
        }

        public function get playerUnderCursor():int
        {
            return (_SafeStr_3721);
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return (_roomSessionManager);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get toolbar():IHabboToolbar
        {
            return (_toolbar);
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        private function fixedUserLocation(_arg_1:int, _arg_2:IVector3d):IVector3d
        {
            if (_arg_2 == null)
            {
                return (null);
            };
            var _local_5:_SafeStr_3178 = getFurniStackingHeightMap(_arg_1);
            var _local_7:_SafeStr_3137 = getLegacyGeometry(_arg_1);
            if (((_local_5 == null) || (_local_7 == null)))
            {
                return (_arg_2);
            };
            var _local_6:Number = _arg_2.z;
            var _local_3:Number = _local_5.getTileHeight(_arg_2.x, _arg_2.y);
            var _local_4:Number = _local_7.getTileHeight(_arg_2.x, _arg_2.y);
            if (((Math.abs((_local_6 - _local_3)) < 0.1) && (Math.abs((_local_3 - _local_4)) < 0.1)))
            {
                _local_6 = _local_7.getFloorAltitude(_arg_2.x, _arg_2.y);
            };
            return (new Vector3d(_arg_2.x, _arg_2.y, _local_6));
        }

        private function get cameraFollowDuration():int
        {
            return ((getBoolean("room.camera.follow_user")) ? 1000 : 0);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function getRenderRoomMessage(_arg_1:Rectangle, _arg_2:uint, _arg_3:Boolean=false, _arg_4:Boolean=true, _arg_5:Boolean=false, _arg_6:int=-1):IMessageComposer
        {
            var _local_8:* = null;
            if (_arg_6 > -1)
            {
                _local_8 = getRoomCanvas(_SafeStr_3699, _arg_6);
            }
            else
            {
                _local_8 = getActiveRoomActiveCanvas();
            };
            if (!_local_8)
            {
                return (null);
            };
            if (_arg_5)
            {
                _local_8.skipSpriteVisibilityChecking();
            };
            var _local_12:int = -1;
            if (((!(_arg_4)) && (!(_roomSessionManager.getSession(_SafeStr_3699) == null))))
            {
                _local_12 = _roomSessionManager.getSession(_SafeStr_3699).ownUserRoomId;
            };
            var _local_11:_SafeStr_3249 = new _SafeStr_3249();
            var _local_10:String = _local_11.getFurniData(_arg_1, _local_8, this, _local_12);
            var _local_9:String = _local_11.getRoomRenderingModifiers(this);
            var _local_7:Array = _local_11.getRoomPlanes(_arg_1, _local_8, this, _arg_2);
            if (_arg_5)
            {
                _local_8.resumeSpriteVisibilityChecking();
            };
            if (_arg_3)
            {
                return (new _SafeStr_688(_local_7, _local_10, _local_9, _SafeStr_3699, _sessionDataManager.topSecurityLevel));
            };
            return (new _SafeStr_687(_local_7, _local_10, _local_9, _SafeStr_3699, _sessionDataManager.topSecurityLevel));
        }

        public function get roomContentLoader():_SafeStr_3143
        {
            return (_SafeStr_3701);
        }


    }
}//package com.sulake.habbo.room

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1588 = "_-7O" (String#14913, DoABC#4)
// _SafeStr_1613 = "_-xG" (String#3181, DoABC#4)
// _SafeStr_1662 = "_-dD" (String#4860, DoABC#4)
// _SafeStr_1675 = "_-j1M" (String#2347, DoABC#4)
// _SafeStr_1688 = "_-d1g" (String#11241, DoABC#4)
// _SafeStr_1689 = "_-018" (String#7789, DoABC#4)
// _SafeStr_1690 = "_-S11" (String#12313, DoABC#4)
// _SafeStr_1691 = "_-l1d" (String#4426, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1699 = "_-uf" (String#3285, DoABC#4)
// _SafeStr_1705 = "_-VD" (String#7365, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3110 = "_-s1g" (String#2208, DoABC#4)
// _SafeStr_3120 = "_-F10" (String#4637, DoABC#4)
// _SafeStr_3127 = "_-ZQ" (String#12286, DoABC#4)
// _SafeStr_3128 = "_-m1W" (String#14687, DoABC#4)
// _SafeStr_3137 = "_-71l" (String#4564, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3143 = "_-s1i" (String#11487, DoABC#4)
// _SafeStr_3172 = "_-eb" (String#2240, DoABC#4)
// _SafeStr_3178 = "_-pR" (String#3386, DoABC#4)
// _SafeStr_3180 = "_-o1D" (String#9450, DoABC#4)
// _SafeStr_3222 = "_-UQ" (String#12398, DoABC#4)
// _SafeStr_3235 = "_-5W" (String#22194, DoABC#4)
// _SafeStr_3247 = "_-o19" (String#3004, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3249 = "_-J1c" (String#13358, DoABC#4)
// _SafeStr_3262 = "_-m1x" (String#5603, DoABC#4)
// _SafeStr_3270 = "_-j1T" (String#7568, DoABC#4)
// _SafeStr_3696 = "_-1y" (String#13037, DoABC#4)
// _SafeStr_3697 = "_-q1Y" (String#6564, DoABC#4)
// _SafeStr_3698 = "_-O16" (String#5635, DoABC#4)
// _SafeStr_3699 = "_-81v" (String#2162, DoABC#4)
// _SafeStr_3700 = "_-xt" (String#2711, DoABC#4)
// _SafeStr_3701 = "_-71M" (String#1266, DoABC#4)
// _SafeStr_3702 = "_-12b" (String#5807, DoABC#4)
// _SafeStr_3703 = "_-Q1Q" (String#7439, DoABC#4)
// _SafeStr_3704 = "_-i1A" (String#7704, DoABC#4)
// _SafeStr_3705 = "_-M7" (String#11232, DoABC#4)
// _SafeStr_3706 = "_-R1" (String#7971, DoABC#4)
// _SafeStr_3707 = "_-m1" (String#5418, DoABC#4)
// _SafeStr_3708 = "_-q1A" (String#4793, DoABC#4)
// _SafeStr_3709 = "_-12f" (String#5371, DoABC#4)
// _SafeStr_3710 = "_-Ki" (String#3194, DoABC#4)
// _SafeStr_3711 = "_-X1s" (String#6831, DoABC#4)
// _SafeStr_3712 = "_-z9" (String#10345, DoABC#4)
// _SafeStr_3713 = "_-Ec" (String#10460, DoABC#4)
// _SafeStr_3714 = "_-21J" (String#6793, DoABC#4)
// _SafeStr_3715 = "_-dy" (String#13599, DoABC#4)
// _SafeStr_3716 = "_-51a" (String#12951, DoABC#4)
// _SafeStr_3717 = "_-h1s" (String#5716, DoABC#4)
// _SafeStr_3718 = "_-32e" (String#10977, DoABC#4)
// _SafeStr_3719 = "_-z1u" (String#19494, DoABC#4)
// _SafeStr_3720 = "_-T1O" (String#21879, DoABC#4)
// _SafeStr_3721 = "_-kS" (String#13435, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_687 = "_-i1T" (String#7627, DoABC#4)
// _SafeStr_688 = "_-Ep" (String#13442, DoABC#4)
// _SafeStr_8304 = "_-F1A" (String#30711, DoABC#4)
// _SafeStr_8305 = "_-CT" (String#22470, DoABC#4)
// _SafeStr_8895 = "_-Y1u" (String#35976, DoABC#4)
// _SafeStr_8896 = "_-Yc" (String#32041, DoABC#4)
// _SafeStr_8897 = "_-32r" (String#32542, DoABC#4)
// _SafeStr_8898 = "_-6C" (String#38594, DoABC#4)
// _SafeStr_8899 = "_-dZ" (String#31709, DoABC#4)
// _SafeStr_8900 = "_-E1l" (String#25123, DoABC#4)
// _SafeStr_8901 = "_-r1J" (String#38958, DoABC#4)


