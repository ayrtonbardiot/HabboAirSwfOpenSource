// by nota

//com.sulake.habbo.game.snowwar.SnowWarEngine

package com.sulake.habbo.game.snowwar
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.game.HabboGameManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.groups._SafeStr_1757;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.ui.IRoomUI;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena;
    import com.sulake.habbo.game.snowwar.ui.GameArenaView;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.game.snowwar.ui.GameLoadingViewController;
    import com.sulake.habbo.game.snowwar.ui.GameEndingViewController;
    import com.sulake.habbo.game.snowwar.ui.GamesMainViewController;
    import com.sulake.habbo.game.snowwar.leaderboard.LeaderboardViewController;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboRoomUI;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDHabboGroupsManager;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
    import com.sulake.habbo.game.snowwar.utils.WindowUtils;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.assets.AssetLibraryCollection;
    import com.sulake.core.assets.XmlAsset;
    import flash.events.Event;
    import _-PD.Game2LoadStageReadyMessageComposer;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.core.communication.messages.IMessageComposer;
    import _-81Y._SafeStr_354;
    import _-81Y.Game2CheckGameDirectoryStatusMessageComposer;
    import _-81Y._SafeStr_454;
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;
    import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
    import _-EH.Game2SetUserMoveTargetMessageComposer;
    import _-EH.Game2ThrowSnowballAtHumanMessageComposer;
    import _-EH.Game2ThrowSnowballAtPositionMessageComposer;
    import _-EH.Game2MakeSnowballMessageComposer;
    import com.sulake.habbo.game.snowwar.events.NewMoveTargetEvent;
    import _-EH.Game2RequestFullStatusUpdateMessageComposer;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.game.snowwar.ui.GameLobbyWindowCtrl;
    import _-81Y.Game2GetAccountGameStatusMessageComposer;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2SnowWarGameStats;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2GameResult;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData;
    import _-PD.Game2PlayAgainMessageComposer;
    import com.sulake.habbo.game.events.GameChatEvent;
    import _-qv._SafeStr_895;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.*;
    import _-81Y.*;
    import _-PD.*;
    import _-EH.*;

    public class SnowWarEngine extends _SafeStr_20 implements _SafeStr_41 
    {

        private static const GHOST_CHECKSUM_TURNS_TO_CHECK:int = 3;
        public static const GET_SNOWWAR_TOKENS:String = "GET_SNOWWAR_TOKENS";
        public static const GET_SNOWWAR_TOKENS2:String = "GET_SNOWWAR_TOKENS2";
        public static const GET_SNOWWAR_TOKENS3:String = "GET_SNOWWAR_TOKENS3";
        public static const STATE_INACTIVE:int = 0;
        public static const STATE_GAME_STARTING:int = 1;
        public static const STATE_STAGE_LOADING:int = 2;
        public static const STATE_STAGE_STARTING:int = 3;
        public static const STATE_STAGE_RUNNING:int = 4;
        public static const STATE_STAGE_ENDING:int = 5;
        public static const STATE_GAME_OVER:int = 6;
        public static const STATE_REJOIN_GAME:int = 7;

        private static var _soundManager:_SafeStr_2088;

        private var _gameManager:HabboGameManager;
        private var _communication:IHabboCommunicationManager;
        private var _windowManager:_SafeStr_1695;
        private var _configuration:_SafeStr_19;
        private var _localization:_SafeStr_18;
        private var _sessionDataManager:ISessionDataManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _avatarManager:_SafeStr_1701;
        private var _SafeStr_5061:_SafeStr_1757;
        private var _roomEngine:IRoomEngine;
        private var _roomUI:IRoomUI;
        private var _catalog:IHabboCatalog;
        private var _SafeStr_3757:_SafeStr_3118;
        private var _habboHelp:IHabboHelp;
        private var _friendList:_SafeStr_1874;
        private var _SafeStr_5062:SynchronizedGameArena;
        private var _SafeStr_5068:GameArenaView;
        private var _timeSinceLastUpdate:int;
        private var _SafeStr_5072:int = 0;
        private var _SafeStr_5066:_SafeStr_3114;
        private var _SafeStr_5071:int;
        private var _players:_SafeStr_24;
        private var _SafeStr_5063:int = 0;
        private var _SafeStr_5075:int = 0;
        private var _SafeStr_5076:int = 0;
        private var _serverChecksums:_SafeStr_24;
        private var _SafeStr_5074:Boolean = false;
        private var _SafeStr_5078:GameLoadingViewController;
        private var _SafeStr_5067:GameEndingViewController;
        private var _SafeStr_5069:GamesMainViewController;
        private var _SafeStr_5070:LeaderboardViewController;
        private var _SafeStr_5064:Boolean = false;
        private var _SafeStr_5065:Boolean = false;
        private var _SafeStr_5073:Boolean = false;
        private var _SafeStr_5077:Boolean = false;
        private var _stageLength:int;
        private var _SafeStr_5079:Boolean = false;
        private var _SafeStr_5080:Boolean = false;
        private var _SafeStr_5081:int = 0;
        private var _roomBeforeGame:int = -1;
        private var _SafeStr_5083:int = -1;
        private var _SafeStr_5082:Boolean = false;

        public function SnowWarEngine(_arg_1:HabboGameManager, _arg_2:_SafeStr_31, _arg_3:uint=0, _arg_4:_SafeStr_21=null)
        {
            super(_arg_2, _arg_3, _arg_4);
            _gameManager = _arg_1;
            queueInterface(new IIDHabboWindowManager(), onWindowManagerReady);
            queueInterface(new IIDHabboCommunicationManager(), onHabboCommunicationReady);
            queueInterface(new IIDHabboConfigurationManager(), onConfigurationReady);
            queueInterface(new IIDHabboLocalizationManager(), onLocalizationReady);
            queueInterface(new IIDHabboRoomSessionManager(), onRoomSessionManagerReady);
            queueInterface(new IIDSessionDataManager(), onSessionDataManagerReady);
            queueInterface(new IIDAvatarRenderManager(), onAvatarRenderedReady);
            queueInterface(new IIDRoomEngine(), onRoomEngineReady);
            queueInterface(new IIDHabboSoundManager(), onSoundManagerReady);
            queueInterface(new IIDHabboRoomUI(), onRoomUIReady);
            queueInterface(new IIDHabboCatalog(), onCatalogReady);
            queueInterface(new IIDHabboHelp(), onHabboHelpReady);
            queueInterface(new IIDHabboFriendList(), onFriendListReady);
            queueInterface(new IIDHabboGroupsManager(), onGroupsManagerReady);
            HabboGamesCom.log(("SnowWarEngine initialized: " + _arg_4));
            _SafeStr_5069 = new GamesMainViewController(this);
        }

        public static function playSound(_arg_1:String, _arg_2:int=0):void
        {
            if (_soundManager != null)
            {
                _soundManager.playSound(_arg_1, _arg_2);
            };
        }

        public static function stopSound(_arg_1:String):void
        {
            if (_soundManager != null)
            {
                _soundManager.stopSound(_arg_1);
            };
        }


        public function get gameCenterEnabled():Boolean
        {
            return (_gameManager.gameCenterEnabled);
        }

        public function get roomEngine():IRoomEngine
        {
            return (_roomEngine);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get communication():IHabboCommunicationManager
        {
            return (_communication);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        public function get config():_SafeStr_19
        {
            return (_configuration);
        }

        public function get avatarManager():_SafeStr_1701
        {
            return (_avatarManager);
        }

        public function get groupsManager():_SafeStr_1757
        {
            return (_SafeStr_5061);
        }

        public function get roomUI():IRoomUI
        {
            return (_roomUI);
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        public function get friendList():_SafeStr_1874
        {
            return (_friendList);
        }

        public function get gameArena():SynchronizedGameArena
        {
            return (_SafeStr_5062);
        }

        public function get currentSubTurn():int
        {
            return (_SafeStr_5063);
        }

        public function get stageLength():int
        {
            return (_stageLength);
        }

        public function get roomBeforeGame():int
        {
            return (_roomBeforeGame);
        }

        public function get isGhostEnabled():Boolean
        {
            return (_SafeStr_5064);
        }

        public function get isGhostVisualizationEnabled():Boolean
        {
            return (_SafeStr_5065);
        }

        public function getArenaName(_arg_1:GameLobbyData):String
        {
            var _local_2:String = ("snowwar.field.name." + _arg_1.fieldType);
            return (localization.getLocalization(_local_2, _local_2));
        }

        override public function dispose():void
        {
            if (_communication)
            {
                _communication.release(new IIDHabboCommunicationManager());
                _communication = null;
            };
            if (_windowManager)
            {
                _windowManager.release(new IIDHabboWindowManager());
                _windowManager = null;
            };
            if (_configuration)
            {
                _configuration.release(new IIDHabboConfigurationManager());
                _configuration = null;
            };
            if (_localization)
            {
                _localization.release(new IIDHabboLocalizationManager());
                _localization = null;
            };
            if (_roomSessionManager)
            {
                _roomSessionManager.release(new IIDHabboRoomSessionManager());
                _roomSessionManager = null;
            };
            if (_sessionDataManager != null)
            {
                _sessionDataManager.release(new IIDSessionDataManager());
                _sessionDataManager = null;
            };
            if (_roomEngine != null)
            {
                _roomEngine.events.removeEventListener("REE_OBJECTS_INITIALIZED", onRoomObjectsInitialized);
                _roomEngine.release(new IIDRoomEngine());
                _roomEngine = null;
            };
            if (_soundManager != null)
            {
                _soundManager.release(new IIDHabboSoundManager());
                _soundManager = null;
            };
            if (_habboHelp != null)
            {
                _habboHelp.release(new IIDHabboHelp());
                _habboHelp = null;
            };
            if (_avatarManager != null)
            {
                _avatarManager.release(new IIDAvatarRenderManager());
                _avatarManager = null;
            };
            if (_SafeStr_5061 != null)
            {
                _SafeStr_5061.release(new IIDHabboGroupsManager());
                _SafeStr_5061 = null;
            };
            if (_roomUI != null)
            {
                _roomUI.release(new IIDHabboRoomUI());
                _roomUI = null;
            };
            if (_catalog != null)
            {
                _catalog.release(new IIDHabboCatalog());
                _catalog = null;
            };
            if (_friendList != null)
            {
                _friendList.release(new IIDHabboFriendList());
                _friendList = null;
            };
            if (_SafeStr_5066 != null)
            {
                _SafeStr_5066.dispose();
                _SafeStr_5066 = null;
            };
            if (_SafeStr_5067)
            {
                _SafeStr_5067.dispose();
                _SafeStr_5067 = null;
            };
            disposeLoadingView();
            if (_SafeStr_5062 != null)
            {
                _SafeStr_5062.dispose();
                _SafeStr_5062 = null;
            };
            if (_SafeStr_5068 != null)
            {
                _SafeStr_5068.dispose();
                _SafeStr_5068 = null;
            };
            if (_SafeStr_5069)
            {
                _SafeStr_5069.dispose();
                _SafeStr_5069 = null;
            };
            if (_SafeStr_3757)
            {
                _SafeStr_3757.dispose();
                _SafeStr_3757 = null;
            };
            if (_SafeStr_5070)
            {
                _SafeStr_5070.dispose();
                _SafeStr_5070 = null;
            };
            super.dispose();
        }

        private function onWindowManagerReady(_arg_1:IID, _arg_2:IUnknown):void
        {
            _windowManager = (_arg_2 as _SafeStr_1695);
            WindowUtils.init(assets, _windowManager);
        }

        private function onHabboCommunicationReady(_arg_1:IID, _arg_2:IUnknown):void
        {
            _communication = (_arg_2 as IHabboCommunicationManager);
            _SafeStr_3757 = new _SafeStr_3118(this);
        }

        private function onConfigurationReady(_arg_1:IID, _arg_2:IUnknown):void
        {
            _configuration = (_arg_2 as _SafeStr_19);
            _SafeStr_5064 = _configuration.getBoolean("snowwar.ghost.enabled");
            if (_SafeStr_5064)
            {
                _SafeStr_5065 = _configuration.getBoolean("snowwar.ghost.visualization.enabled");
                _SafeStr_5073 = _configuration.getBoolean("snowwar.ghost.immediate.enabled");
            };
            HabboGamesCom.logEnabled = _configuration.getBoolean("snowwar.log.enabled");
        }

        private function onLocalizationReady(_arg_1:IID, _arg_2:IUnknown):void
        {
            _localization = (_arg_2 as _SafeStr_18);
        }

        private function onSessionDataManagerReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            _sessionDataManager = (_arg_2 as ISessionDataManager);
        }

        private function onRoomSessionManagerReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            _roomSessionManager = (_arg_2 as IRoomSessionManager);
        }

        private function onAvatarRenderedReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            _avatarManager = (_arg_2 as _SafeStr_1701);
            _avatarManager.events.addEventListener("AVATAR_RENDER_READY", onAvatarReady);
        }

        private function onGroupsManagerReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_5061 = (_arg_2 as _SafeStr_1757);
        }

        private function onAvatarReady(_arg_1:Event):void
        {
            var _local_3:* = null;
            var _local_2:Boolean = (context.assets as AssetLibraryCollection).hasAssetLibrary(assets.name);
            if (!_local_2)
            {
                HabboGamesCom.log(assets.manifest);
                (context.assets as AssetLibraryCollection).addAssetLibrary(assets);
                _local_3 = (assets.getAssetByName("figure") as XmlAsset);
                _avatarManager.injectFigureData((_local_3.content as XML));
                _avatarManager.resetAssetManager();
            };
        }

        private function onRoomEngineReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _roomEngine = (_arg_2 as IRoomEngine);
            _roomEngine.events.addEventListener("REE_OBJECTS_INITIALIZED", onRoomObjectsInitialized);
        }

        private function onRoomObjectsInitialized(_arg_1:RoomEngineEvent):void
        {
            if (_SafeStr_5062)
            {
                send(new Game2LoadStageReadyMessageComposer(100));
            };
        }

        public function send(_arg_1:IMessageComposer):void
        {
            if (_communication)
            {
                _communication.connection.send(_arg_1);
            };
        }

        private function onSoundManagerReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            _soundManager = _SafeStr_2088(_arg_2);
        }

        private function onRoomUIReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            _roomUI = (_arg_2 as IRoomUI);
        }

        private function onCatalogReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            _catalog = (_arg_2 as IHabboCatalog);
        }

        public function showGamesMainView():void
        {
            _SafeStr_5069.toggleVisibility();
        }

        private function onHabboHelpReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _habboHelp = (_arg_2 as IHabboHelp);
        }

        private function onFriendListReady(_arg_1:IID=null, _arg_2:IUnknown=null):void
        {
            if (disposed)
            {
                return;
            };
            _friendList = (_arg_2 as _SafeStr_1874);
        }

        public function onGameDirectoryAvailable(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                showGamesMainView();
            };
        }

        public function initArena(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Array):void
        {
            if (!_SafeStr_5062)
            {
                _SafeStr_5062 = new SynchronizedGameArena();
                _SafeStr_5062.setExtension(new _SafeStr_3352());
                _SafeStr_5062.initialize(this, _arg_3);
                _SafeStr_5068 = new GameArenaView(this);
                _roomSessionManager.disposeSession(-1, false);
                _roomSessionManager.startGameSession();
                registerUpdateReceiver(this, 1);
                _timeSinceLastUpdate = 0;
                _SafeStr_5063 = 0;
                _SafeStr_5075 = 0;
            };
        }

        public function startServerGame(_arg_1:String):void
        {
            initGameDirectoryConnection();
            send(new _SafeStr_354(_arg_1));
        }

        public function initGameDirectoryConnection():void
        {
            send(new Game2CheckGameDirectoryStatusMessageComposer());
        }

        public function startQuickServerGame():void
        {
            send(new _SafeStr_454());
        }

        private function getCurrentStage():_SafeStr_3310
        {
            if (!_SafeStr_5062)
            {
                return (null);
            };
            return (_SafeStr_5062.getCurrentStage() as _SafeStr_3310);
        }

        public function getCurrentPlayer():HumanGameObject
        {
            return (getPlayer(_SafeStr_5071));
        }

        public function getPlayer(_arg_1:int):HumanGameObject
        {
            var _local_2:_SafeStr_3309 = getCurrentStage();
            if (!_local_2)
            {
                return (null);
            };
            return (_local_2.getGameObject(_arg_1) as HumanGameObject);
        }

        public function handleClickOnTile(_arg_1:RoomObjectTileMouseEvent):void
        {
            if (_SafeStr_5072 != 4)
            {
                return;
            };
            var _local_2:int = _SafeStr_3341.getClickTypeOnTile(_arg_1.altKey, _arg_1.shiftKey);
            if (_local_2 == 0)
            {
                moveOwnAvatarTo(_arg_1.tileXAsInt, _arg_1.tileYAsInt);
            }
            else
            {
                throwSnowballAt(_arg_1.tileXAsInt, _arg_1.tileYAsInt, getTrajectoryFromClickType(_local_2));
            };
        }

        public function handleClickOnHuman(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_7:* = null;
            var _local_4:* = null;
            var _local_6:int;
            if (_SafeStr_5072 != 4)
            {
                return;
            };
            var _local_5:HumanGameObject = getGhostPlayer();
            if (((_arg_1 == _SafeStr_5071) || (((_SafeStr_5064) && (_local_5)) && (_arg_1 == _local_5.gameObjectId))))
            {
                if (((makeSnowball()) && (_SafeStr_5068)))
                {
                    _SafeStr_5068.startWaitingForSnowball();
                };
            }
            else
            {
                _local_7 = getCurrentPlayer();
                _local_4 = getPlayer(_arg_1);
                if ((((_local_7) && (_local_4)) && (!(_local_7.team == _local_4.team))))
                {
                    _local_6 = _SafeStr_3341.getClickTypeOnOpponent(_arg_2, _arg_3);
                    throwSnowballAtHuman(_arg_1, getTrajectoryFromClickType(_local_6));
                };
            };
        }

        public function handleMouseOverOnHuman(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:HumanGameObject = getPlayer(_arg_1);
            if (!_local_6)
            {
                return;
            };
            if (_configuration.getBoolean("snowstorm.settings.show_user_names"))
            {
                _local_4 = ((_local_6.team == 1) ? 4281310921 : 4290988872);
                _local_5 = 500;
                _roomUI.showGamePlayerName(_local_6.gameObjectId, _local_6.name, _local_4, _local_5);
            };
            if (_SafeStr_5072 == 4)
            {
                _SafeStr_5068.updateTileCursor(_local_6.team);
            };
        }

        public function moveOwnAvatarTo(_arg_1:int, _arg_2:int):void
        {
            var _local_6:int;
            var _local_5:int;
            var _local_3:* = null;
            if (_SafeStr_5072 != 4)
            {
                return;
            };
            var _local_4:HumanGameObject = getCurrentPlayer();
            if (_local_4)
            {
                _local_6 = (_arg_1 * 3200);
                _local_5 = (_arg_2 * 3200);
                _local_3 = getCurrentStage();
                if (_local_3)
                {
                    send(new Game2SetUserMoveTargetMessageComposer(_local_6, _local_5, _SafeStr_5062.getTurnNumber(), _SafeStr_5062.subturn));
                    walkGhost(_local_4, _local_6, _local_5);
                };
            };
        }

        public function getGhostPlayer():HumanGameObject
        {
            var _local_1:HumanGameObject = getCurrentPlayer();
            if (_local_1)
            {
                return (getPlayer(_local_1.ghostObjectId));
            };
            return (null);
        }

        private function throwSnowballAtHuman(_arg_1:int, _arg_2:int):void
        {
            var _local_3:HumanGameObject = getCurrentPlayer();
            if (((_local_3) && (_local_3.canThrowSnowballs())))
            {
                send(new Game2ThrowSnowballAtHumanMessageComposer(_arg_1, _arg_2, _SafeStr_5062.getTurnNumber(), _SafeStr_5062.subturn));
                stopGhost();
            };
        }

        private function throwSnowballAt(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            var _local_6:int;
            var _local_5:int;
            var _local_4:HumanGameObject = getCurrentPlayer();
            if (((_local_4) && (_local_4.canThrowSnowballs())))
            {
                _local_6 = (_arg_1 * 3200);
                _local_5 = (_arg_2 * 3200);
                send(new Game2ThrowSnowballAtPositionMessageComposer(_local_6, _local_5, _arg_3, _SafeStr_5062.getTurnNumber(), _SafeStr_5062.subturn));
                stopGhost();
            };
        }

        private function getTrajectoryFromClickType(_arg_1:int):int
        {
            var _local_2:int;
            switch (_arg_1)
            {
                case 2:
                    _local_2 = 2;
                    break;
                case 3:
                    _local_2 = 1;
                    break;
                case 1:
                    _local_2 = 0;
                    break;
                default:
                    _local_2 = 3;
            };
            return (_local_2);
        }

        public function makeSnowball():Boolean
        {
            if (_SafeStr_5072 != 4)
            {
                return (false);
            };
            var _local_1:HumanGameObject = getCurrentPlayer();
            if (((_local_1) && (_local_1.canMakeSnowballs())))
            {
                send(new Game2MakeSnowballMessageComposer(_SafeStr_5062.getTurnNumber(), _SafeStr_5062.subturn));
                stopGhost();
                return (true);
            };
            return (false);
        }

        private function walkGhost(_arg_1:HumanGameObject, _arg_2:int, _arg_3:int):void
        {
            var _local_6:Boolean;
            var _local_4:* = null;
            var _local_5:* = null;
            if (_SafeStr_5064)
            {
                _local_6 = (((_arg_1) && (!(_arg_1.posture == "swdieback"))) && (!(_arg_1.posture == "swdiefront")));
                _local_4 = getGhostPlayer();
                if (((_local_4) && (_local_6)))
                {
                    _local_5 = new NewMoveTargetEvent(_local_4, _arg_2, _arg_3);
                    if (_SafeStr_5073)
                    {
                        _local_5.apply(gameArena.getCurrentStage());
                    }
                    else
                    {
                        gameArena.addGameEvent(gameArena.getTurnNumber(), gameArena.subturn, _local_5);
                    };
                };
            };
        }

        private function stopGhost():void
        {
            var _local_1:* = null;
            if (_SafeStr_5064)
            {
                _local_1 = getGhostPlayer();
                if (_local_1)
                {
                    _local_1.stopMovement();
                };
            };
        }

        public function update(_arg_1:uint):void
        {
            var _local_9:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_3:Boolean;
            var _local_10:Boolean;
            var _local_2:int;
            var _local_4:uint;
            if ((((!(_SafeStr_5062)) || ((!(_SafeStr_5072)) == 4)) || ((!(_SafeStr_5072)) == 3)))
            {
                return;
            };
            if (((_SafeStr_5068) && (_SafeStr_5072 == 3)))
            {
                _SafeStr_5068.update(_arg_1, (_SafeStr_5062.subturn == 0));
            };
            _timeSinceLastUpdate = (_timeSinceLastUpdate + _arg_1);
            var _local_8:int = (_SafeStr_5062.getExtension() as _SafeStr_3352).getPulseInterval();
            if ((((!(_SafeStr_5074)) && (_timeSinceLastUpdate > _local_8)) && (_SafeStr_5063 < _SafeStr_5075)))
            {
                _SafeStr_5062.pulse();
                _timeSinceLastUpdate = (_timeSinceLastUpdate - _local_8);
                _SafeStr_5063++;
                if (_timeSinceLastUpdate > _local_8)
                {
                    _timeSinceLastUpdate = 0;
                };
                _local_9 = (_SafeStr_5075 - currentSubTurn);
                while (_local_9-- > 3)
                {
                    _SafeStr_5062.pulse();
                    _SafeStr_5063++;
                };
                if (((_SafeStr_5068) && (_SafeStr_5072 == 4)))
                {
                    _SafeStr_5068.update(_arg_1, (_SafeStr_5062.subturn == 0));
                };
                if ((_SafeStr_5063 % _SafeStr_5062.getNumberOfSubTurns()) == 0)
                {
                    _local_5 = (gameArena.getTurnNumber() - 1);
                    _local_6 = gameArena.getCheckSum(_local_5);
                    _local_7 = _serverChecksums[_local_5];
                    checkGhostLocation(_local_5);
                    _local_3 = (_local_5 < (_SafeStr_5076 - 3));
                    _local_10 = (!(_local_7 == _local_6));
                    if ((((_local_3) || (_local_10)) || (_SafeStr_5077)))
                    {
                        HabboGamesCom.log(((((((((("Turn: " + [_local_5, _SafeStr_5076]) + " currentSubTurn:") + _SafeStr_5063) + " maxSubTurn:") + _SafeStr_5075) + " serverChecksum:") + _local_7) + " clientChecksum:") + _local_6));
                        if (_local_3)
                        {
                            _local_2 = 0;
                            _local_4 = 0xFF00FF;
                            HabboGamesCom.log("CLIENT TOO MUCH BEHIND, requesting full status!");
                        }
                        else
                        {
                            if (_local_10)
                            {
                                _local_2 = 1;
                                _local_4 = 0xFF0000;
                                HabboGamesCom.log("CHECKSUM MISMATCH, requesting full status!");
                            }
                            else
                            {
                                _local_2 = -1;
                                _local_4 = 0xFF;
                                HabboGamesCom.log("ERROR WAS GENERATED! Requesting full status!");
                            };
                        };
                        _SafeStr_5068.showChecksumError(_local_4);
                        requestFullStatus(_local_2);
                        _SafeStr_5077 = false;
                        _SafeStr_5074 = true;
                    };
                };
            };
        }

        private function checkGhostLocation(_arg_1:int):void
        {
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_5:Boolean;
            var _local_4:int;
            if (_SafeStr_5064)
            {
                _local_3 = getCurrentPlayer();
                _local_6 = _local_3.currentLocation;
                _local_2 = getGhostPlayer();
                _local_5 = false;
                _local_4 = -3;
                while (_local_4 < 3)
                {
                    _local_5 = _local_2.isInGhostDistance((_arg_1 + _local_4), _local_6);
                    if (_local_5) break;
                    _local_4++;
                };
                _local_2.removeGhostLocation((_arg_1 - 3));
                if (((!(_local_5)) && (_arg_1 > 3)))
                {
                    HabboGamesCom.log(((("GHOST CHECKSUM MISMATCH, checksumTurn:" + _arg_1) + " currentLocation:") + _local_6));
                    _local_2.reinitGhost(_local_3);
                    _local_2.addGhostLocation(_arg_1);
                    _SafeStr_5068.showChecksumError(0xFF00);
                };
            };
        }

        public function nextTurn(_arg_1:int, _arg_2:int, _arg_3:Boolean=false):void
        {
            _SafeStr_5076 = _arg_1;
            _serverChecksums[_SafeStr_5076] = _arg_2;
            _SafeStr_5075 = ((_arg_1 + 1) * gameArena.getNumberOfSubTurns());
            if (_arg_3)
            {
                _SafeStr_5063 = (_SafeStr_5075 - gameArena.getNumberOfSubTurns());
                _timeSinceLastUpdate = (gameArena.getExtension() as _SafeStr_3352).getPulseInterval();
                _SafeStr_5074 = false;
                if (_SafeStr_5064)
                {
                    getGhostPlayer().addGhostLocation(_SafeStr_5076);
                };
            };
        }

        public function requestFullStatus(_arg_1:int):void
        {
            send(new Game2RequestFullStatusUpdateMessageComposer(_arg_1));
        }

        public function alert(_arg_1:String):void
        {
            removeOldAlert();
            if (!_SafeStr_5066)
            {
                _SafeStr_5066 = _windowManager.alert("SnowWar Alert", _arg_1, 0, onAlertClose);
            }
            else
            {
                _SafeStr_5066.summary = _arg_1;
            };
            HabboGamesCom.log(("[HabboGameManager.alert] " + _arg_1));
        }

        public function disposeLoadingView():void
        {
            if (_SafeStr_5078)
            {
                _SafeStr_5078.dispose();
                _SafeStr_5078 = null;
            };
        }

        public function removeOldAlert():void
        {
            if (_SafeStr_5066)
            {
                _SafeStr_5066.dispose();
                _SafeStr_5066 = null;
            };
        }

        public function generateChecksumMismatch():void
        {
            if (_SafeStr_5072 != 4)
            {
                return;
            };
            _SafeStr_5077 = true;
        }

        private function onAlertClose(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            removeOldAlert();
        }

        public function set ownId(_arg_1:int):void
        {
            _SafeStr_5071 = _arg_1;
        }

        public function get ownId():int
        {
            return (_SafeStr_5071);
        }

        public function initView():void
        {
            if (_SafeStr_5068)
            {
                _SafeStr_5068.init();
            };
        }

        public function get mainView():GamesMainViewController
        {
            return (_SafeStr_5069);
        }

        public function get lobbyView():GameLobbyWindowCtrl
        {
            if (_SafeStr_5069)
            {
                return (_SafeStr_5069.lobbyView);
            };
            return (null);
        }

        public function stageLoading(_arg_1:int, _arg_2:Array):void
        {
            if (_SafeStr_5078 != null)
            {
                _SafeStr_5072 = 2;
                _SafeStr_5078.showReadyPlayers(_arg_2);
            };
        }

        public function startStage(_arg_1:int):void
        {
            if (_SafeStr_5068)
            {
                _roomUI.visible = true;
                disposeLoadingView();
                playSound("HBSTG_ig_countdown");
                _SafeStr_5068.initGameUI(_arg_1);
                _SafeStr_5072 = 3;
            };
        }

        public function stageRunning(_arg_1:int):void
        {
            if (_arg_1 > 0)
            {
                _stageLength = _arg_1;
                _SafeStr_5072 = 4;
            }
            else
            {
                _SafeStr_5072 = 5;
            };
            _SafeStr_5063 = 0;
            _SafeStr_5075 = 0;
        }

        public function resetGameSession():void
        {
            _roomEngine.isGameMode = false;
            _SafeStr_5072 = 5;
            removeUpdateReceiver(this);
            if (_SafeStr_5062)
            {
                _SafeStr_5062.dispose();
                _SafeStr_5062 = null;
            };
            stopSound("HBSTG_snowwar_walk");
            send(new Game2GetAccountGameStatusMessageComposer(0));
        }

        public function resetRoomSession():void
        {
            _roomSessionManager.disposeGameSession();
            if (_SafeStr_5068)
            {
                _SafeStr_5068.dispose();
                _SafeStr_5068 = null;
            };
        }

        public function gameOver(_arg_1:int, _arg_2:Array, _arg_3:Game2SnowWarGameStats, _arg_4:Game2GameResult):void
        {
            _SafeStr_5072 = 6;
            _SafeStr_5069.close(false);
            if (_SafeStr_5067)
            {
                _SafeStr_5067.dispose();
                _SafeStr_5067 = null;
            };
            if (_SafeStr_5068)
            {
                _SafeStr_5068.removeGameUI();
            };
            _SafeStr_5067 = new GameEndingViewController(this, _arg_2, _arg_3, _arg_4, _arg_1);
        }

        public function gameStarted(_arg_1:GameLobbyData):void
        {
            _SafeStr_5072 = 1;
            _SafeStr_5079 = false;
            _players = new _SafeStr_24();
            _serverChecksums = new _SafeStr_24();
            for each (var _local_2:GameLobbyPlayerData in _arg_1.players)
            {
                _players.add(_local_2.userId, _local_2);
            };
            if (_SafeStr_5067)
            {
                _SafeStr_5067.dispose();
                _SafeStr_5067 = null;
            };
            if (!_SafeStr_5078)
            {
                _SafeStr_5078 = new GameLoadingViewController(this);
            };
            _SafeStr_5078.show(_arg_1);
        }

        public function rejoinGame(_arg_1:int):void
        {
            _SafeStr_5072 = ((_SafeStr_5079) ? 7 : 6);
            _roomBeforeGame = _arg_1;
            if (_SafeStr_5067)
            {
                _SafeStr_5067.changeToWaitState(_SafeStr_5079);
                _SafeStr_5079 = false;
            };
        }

        public function playerRematches(_arg_1:int):void
        {
            if (_SafeStr_5067)
            {
                _SafeStr_5067.playerRematches(_arg_1);
            };
        }

        public function startLobbyCounter(_arg_1:int):void
        {
            if (((_SafeStr_5072 == 7) && (!(_SafeStr_5067 == null))))
            {
                _SafeStr_5067.startLobbyCountDown(_arg_1);
            }
            else
            {
                if (lobbyView)
                {
                    lobbyView.startCountdown(_arg_1);
                };
            };
        }

        public function sendRejoinGame():void
        {
            _SafeStr_5079 = true;
            send(new Game2PlayAgainMessageComposer());
        }

        public function addChatMessage(_arg_1:int, _arg_2:String, _arg_3:Boolean=false):void
        {
            var _local_6:GameLobbyPlayerData = _players.getValue(_arg_1);
            var _local_5:int = ((_local_6.teamId == 1) ? -300 : 300);
            var _local_4:uint = ((_local_6.teamId == 1) ? 0xFF : 0xFF0000);
            _gameManager.events.dispatchEvent(new GameChatEvent("gce_game_chat", _arg_1, _arg_2, _local_5, _local_4, _local_6.figure, _local_6.gender, _local_6.name, _local_6.teamId, _arg_3));
        }

        public function stopLobbyCounter():void
        {
            if (((_SafeStr_5072 == 7) && (!(_SafeStr_5067 == null))))
            {
                _SafeStr_5079 = true;
                _SafeStr_5067.changeToWaitState(_SafeStr_5079);
            }
            else
            {
                if (lobbyView)
                {
                    lobbyView.stopCountdown();
                };
            };
        }

        public function createLobby(_arg_1:GameLobbyData):void
        {
            var _local_2:* = null;
            if (_SafeStr_5072 == 6)
            {
                _SafeStr_5079 = true;
            };
            if (((!(_SafeStr_5067 == null)) && (!(_SafeStr_5072 == 7))))
            {
                _SafeStr_5067.changeToWaitState(_SafeStr_5079);
                _SafeStr_5072 = 7;
                _SafeStr_5079 = false;
            };
            if (((_SafeStr_5072 == 7) && (!(_SafeStr_5067 == null))))
            {
                _SafeStr_5067.changeToLobbyState(_arg_1);
                for each (_local_2 in _arg_1.players)
                {
                    _SafeStr_5067.playerJoined(_local_2);
                };
            }
            else
            {
                _SafeStr_5072 = 0;
                mainView.openGameLobbyWindow(getArenaName(_arg_1), _arg_1.numberOfTeams, _arg_1.maximumPlayers);
                for each (_local_2 in _arg_1.players)
                {
                    lobbyView.playerJoined(_local_2);
                };
            };
        }

        public function userJoined(_arg_1:GameLobbyPlayerData):void
        {
            if (((_SafeStr_5072 == 7) && (!(_SafeStr_5067 == null))))
            {
                _SafeStr_5067.playerJoined(_arg_1);
            }
            else
            {
                _SafeStr_5072 = 0;
                if (lobbyView)
                {
                    lobbyView.playerJoined(_arg_1);
                };
            };
        }

        public function userLeft(_arg_1:int):void
        {
            if (((_SafeStr_5072 == 7) && (!(_SafeStr_5067 == null))))
            {
                _SafeStr_5067.playerLeft(_arg_1);
            }
            else
            {
                _SafeStr_5072 = 0;
                if (lobbyView)
                {
                    lobbyView.playerLeft(_arg_1);
                };
            };
        }

        public function gamesLeft(_arg_1:int, _arg_2:Boolean, _arg_3:int):void
        {
            if (_arg_1 == 0)
            {
                _SafeStr_5080 = _arg_2;
                _SafeStr_5081 = _arg_3;
                if (_SafeStr_5067)
                {
                    _SafeStr_5067.updateGamesLeft();
                };
                if (_SafeStr_5069)
                {
                    _SafeStr_5069.updateGameStartingStatus();
                };
            };
        }

        public function get isGameStarting():Boolean
        {
            return ((_SafeStr_5072 == 1) || (_SafeStr_5072 == 7));
        }

        public function resetSession():void
        {
            resetGameSession();
            resetRoomSession();
            if (_SafeStr_5067)
            {
                _SafeStr_5067.dispose();
                _SafeStr_5067 = null;
            };
            if (_SafeStr_5069)
            {
                _SafeStr_5069.openMainWindow(false);
            };
        }

        public function gameCancelled(_arg_1:Boolean):void
        {
            resetSession();
            if (_arg_1)
            {
                _gameManager.onSnowWarArenaSessionEnded();
            };
        }

        public function get hasUnlimitedGames():Boolean
        {
            return (_SafeStr_5080);
        }

        public function get freeGamesLeft():int
        {
            return (_SafeStr_5081);
        }

        public function stopWaitingForSnowball(_arg_1:int):void
        {
            if (((!(_SafeStr_5068 == null)) && (_arg_1 == _SafeStr_5071)))
            {
                _SafeStr_5068.stopWaitingForSnowball();
            };
        }

        public function openGetMoreGames(_arg_1:String):void
        {
            _catalog.buySnowWarTokensOffer("GET_SNOWWAR_TOKENS");
            logGameEvent(_arg_1);
        }

        public function openClubCenter(_arg_1:String):void
        {
            _catalog.openClubCenter();
            logGameEvent(_arg_1);
        }

        public function logGameEvent(_arg_1:String):void
        {
            send(new _SafeStr_895("GameFramework", "SnowStorm", _arg_1, "", freeGamesLeft));
        }

        public function registerHit(_arg_1:HumanGameObject, _arg_2:HumanGameObject):void
        {
            if (_SafeStr_5071 == _arg_1.gameObjectId)
            {
                _SafeStr_5068.flashOwnScore(false);
            }
            else
            {
                if (_SafeStr_5071 == _arg_2.gameObjectId)
                {
                    _SafeStr_5068.flashOwnScore(true);
                };
            };
        }

        public function set gamesPlayed(_arg_1:int):void
        {
            _SafeStr_5083 = _arg_1;
        }

        public function promoteGame():void
        {
            if (((_SafeStr_5082) || (!(_SafeStr_5083 == 0))))
            {
                return;
            };
            _SafeStr_5082 = true;
            var _local_2:* = (_configuration.getInteger("new.identity", 0) > 0);
            var _local_1:String = _configuration.getProperty("new.user.wing");
            if (((_local_2) && (!(_local_1 == "game"))))
            {
                return;
            };
            _habboHelp.showWelcomeScreen("HTIE_ICON_GAMES", "snowwar.promotion", 0, "GAMES");
        }

        public function showLeaderboard():void
        {
            leaderboard.selectedGame = 0;
            leaderboard.showFriendsAllTime();
        }

        public function get leaderboard():LeaderboardViewController
        {
            if (((!(_SafeStr_5070)) && (!(gameCenterEnabled))))
            {
                _SafeStr_5070 = new LeaderboardViewController(this);
            };
            return (_SafeStr_5070);
        }


    }
}//package com.sulake.habbo.game.snowwar

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1757 = "_-h1P" (String#4520, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_3341 = "_-T1j" (String#13902, DoABC#4)
// _SafeStr_3352 = "_-32E" (String#7620, DoABC#4)
// _SafeStr_354 = "_-o1W" (String#21915, DoABC#4)
// _SafeStr_3757 = "_-iH" (String#1838, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_454 = "_-Mp" (String#18946, DoABC#4)
// _SafeStr_5061 = "_-v1S" (String#5449, DoABC#4)
// _SafeStr_5062 = "_-81r" (String#2028, DoABC#4)
// _SafeStr_5063 = "_-L1O" (String#4544, DoABC#4)
// _SafeStr_5064 = "_-d6" (String#7731, DoABC#4)
// _SafeStr_5065 = "_-hM" (String#18065, DoABC#4)
// _SafeStr_5066 = "_-rP" (String#5651, DoABC#4)
// _SafeStr_5067 = "_-V1y" (String#2288, DoABC#4)
// _SafeStr_5068 = "_-A1q" (String#2774, DoABC#4)
// _SafeStr_5069 = "_-mN" (String#4661, DoABC#4)
// _SafeStr_5070 = "_-zZ" (String#8702, DoABC#4)
// _SafeStr_5071 = "_-R1d" (String#8036, DoABC#4)
// _SafeStr_5072 = "_-V17" (String#2068, DoABC#4)
// _SafeStr_5073 = "_-Wj" (String#19158, DoABC#4)
// _SafeStr_5074 = "_-t1H" (String#13609, DoABC#4)
// _SafeStr_5075 = "_-81l" (String#6837, DoABC#4)
// _SafeStr_5076 = "_-kQ" (String#10315, DoABC#4)
// _SafeStr_5077 = "_-I1F" (String#12947, DoABC#4)
// _SafeStr_5078 = "_-I14" (String#6894, DoABC#4)
// _SafeStr_5079 = "_-B1z" (String#4372, DoABC#4)
// _SafeStr_5080 = "_-Ku" (String#18821, DoABC#4)
// _SafeStr_5081 = "_-p1A" (String#22768, DoABC#4)
// _SafeStr_5082 = "_-S1b" (String#22056, DoABC#4)
// _SafeStr_5083 = "_-t16" (String#18738, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


