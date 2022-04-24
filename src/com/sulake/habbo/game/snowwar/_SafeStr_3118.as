// by nota

//com.sulake.habbo.game.snowwar._SafeStr_3118

package com.sulake.habbo.game.snowwar
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import _-K1h._SafeStr_308;
    import _-1O._SafeStr_837;
    import _-1O.Game2StopCounterMessageEvent;
    import _-wo.Game2WeeklyGroupLeaderboardEvent;
    import _-1O.Game2GameDirectoryStatusMessageEvent;
    import _-1O.Game2AccountGameStatusMessageEvent;
    import _-1O.Game2InArenaQueueMessageEvent;
    import _-K1h._SafeStr_988;
    import _-1O._SafeStr_667;
    import _-K1h._SafeStr_306;
    import _-wo.Game2TotalLeaderboardEvent;
    import _-1O.Game2StartCounterMessageEvent;
    import _-W1K._SafeStr_990;
    import _-1O.Game2UserLeftGameMessageEvent;
    import _-K1h._SafeStr_215;
    import _-K1h._SafeStr_701;
    import _-wo.Game2WeeklyLeaderboardEvent;
    import _-K1h._SafeStr_642;
    import _-JZ._SafeStr_999;
    import _-Ol._SafeStr_484;
    import _-1O.Game2GameCancelledMessageEvent;
    import _-K1h._SafeStr_263;
    import _-1O._SafeStr_405;
    import _-wo.Game2TotalGroupLeaderboardEvent;
    import _-JZ._SafeStr_340;
    import _-K1h._SafeStr_240;
    import _-1O.Game2StartingGameFailedMessageEvent;
    import _-K1h._SafeStr_249;
    import _-K1h._SafeStr_592;
    import _-1O._SafeStr_400;
    import _-wo.Game2FriendsLeaderboardEvent;
    import _-K1h._SafeStr_898;
    import _-1O.Game2JoiningGameFailedMessageEvent;
    import _-K1h._SafeStr_848;
    import _-1O.Game2UserBlockedMessageEvent;
    import _-K1h._SafeStr_388;
    import _-wo.Game2WeeklyFriendsLeaderboardEvent;
    import _-sq._SafeStr_1434;
    import com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena;
    import com.sulake.habbo.game.snowwar.arena._SafeStr_3309;
    import _-sq._SafeStr_1472;
    import _-sq._SafeStr_1505;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerData;
    import _-sq._SafeStr_1386;
    import _-sq._SafeStr_1240;
    import _-sq._SafeStr_1321;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameObjectsData;
    import _-sq._SafeStr_1315;
    import _-sq._SafeStr_1402;
    import _-sq._SafeStr_1158;
    import _-sq._SafeStr_1047;
    import _-sq._SafeStr_1161;
    import _-sq._SafeStr_1518;
    import _-TY.Game2GameDirectoryStatusMessageParser;
    import _-TY.Game2AccountGameStatusMessageParser;
    import _-TY._SafeStr_1487;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
    import _-TY._SafeStr_1427;
    import _-TY.Game2StartCounterMessageParser;
    import _-TY.Game2InArenaQueueMessageParser;
    import _-TY._SafeStr_1116;
    import _-TY.Game2UserLeftGameMessageParser;
    import _-TY._SafeStr_1187;
    import _-TY.Game2JoiningGameFailedMessageParser;
    import _-TY.Game2UserBlockedMessageParser;
    import _-uX._SafeStr_1431;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.FullGameStatusData;
    import _-uX._SafeStr_1452;
    import _-kg.SnowWarGameObjectData;
    import _-kg.HumanGameObjectData;
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
    import _-kg.SnowballGameObjectData;
    import com.sulake.habbo.game.snowwar.gameobjects.SnowBallGameObject;
    import _-kg.SnowballMachineGameObjectData;
    import com.sulake.habbo.game.snowwar.gameobjects.SnowballMachineGameObject;
    import _-kg.SnowballPileGameObjectData;
    import com.sulake.habbo.game.snowwar.gameobjects.SnowballPileGameObject;
    import _-kg.TreeGameObjectData;
    import com.sulake.habbo.game.snowwar.gameobjects.TreeGameObject;
    import com.sulake.core.utils._SafeStr_24;
    import _-CV.SnowWarGameEventData;
    import _-CV.CreateSnowballEventData;
    import _-CV.HumanGetsSnowballsFromMachineEventData;
    import _-CV.HumanStartsToMakeASnowballEventData;
    import _-CV.MachineCreatesSnowballEventData;
    import _-CV.NewMoveTargetEventData;
    import _-CV.HumanThrowsSnowballAtHumanEventData;
    import _-CV.HumanThrowsSnowballAtPositionEventData;
    import _-CV.HumanLeftGameEventData;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameStatusData;
    import com.sulake.habbo.game.snowwar.gameobjects.SnowballGivingGameObject;
    import com.sulake.habbo.game.snowwar.events.HumanGetsSnowballsFromMachineEvent;
    import com.sulake.habbo.game.snowwar.events.MachineCreatesSnowballEvent;
    import com.sulake.habbo.game.snowwar.events.HumanThrowsSnowballAtPositionEvent;
    import com.sulake.habbo.game.snowwar.events.HumanThrowsSnowballAtHumanEvent;
    import com.sulake.habbo.game.snowwar.events.HumanStartsToMakeASnowballEvent;
    import com.sulake.habbo.game.snowwar.events.CreateSnowballEvent;
    import com.sulake.habbo.game.snowwar.events.NewMoveTargetEvent;
    import com.sulake.habbo.game.snowwar.events.HumanLeftGameEvent;
    import _-sq._SafeStr_1297;
    import _-81Y.Game2GetAccountGameStatusMessageComposer;
    import _-d1Q.Game2LeaderboardParser;
    import _-d1Q.Game2GroupLeaderboardParser;
    import _-d1Q.Game2WeeklyGroupLeaderboardParser;
    import _-d1Q.Game2WeeklyLeaderboardParser;

    [SecureSWF(rename="true")]
    public class _SafeStr_3118 implements _SafeStr_13 
    {

        private var _SafeStr_3758:SnowWarEngine;
        private var _SafeStr_4036:Boolean = false;

        public function _SafeStr_3118(_arg_1:SnowWarEngine)
        {
            _SafeStr_3758 = _arg_1;
            var _local_2:IHabboCommunicationManager = _SafeStr_3758.communication;
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_308(onStageEnding));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_837(onGameCreated));
            _local_2.addHabboConnectionMessageEvent(new Game2StopCounterMessageEvent(onLobbyCounterStop));
            _local_2.addHabboConnectionMessageEvent(new Game2WeeklyGroupLeaderboardEvent(onWeeklyGroupLeaderboard));
            _local_2.addHabboConnectionMessageEvent(new Game2GameDirectoryStatusMessageEvent(onGameDirectoryStatus));
            _local_2.addHabboConnectionMessageEvent(new Game2AccountGameStatusMessageEvent(onAccountGameStatus));
            _local_2.addHabboConnectionMessageEvent(new Game2InArenaQueueMessageEvent(onInArenaQueue));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_988(onStageRunning));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_667(onGameLongData));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_306(onPlayerExitedArena));
            _local_2.addHabboConnectionMessageEvent(new Game2TotalLeaderboardEvent(onTotalLeaderboard));
            _local_2.addHabboConnectionMessageEvent(new Game2StartCounterMessageEvent(onLobbyCounterStart));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_990(onSubscriptionStatus));
            _local_2.addHabboConnectionMessageEvent(new Game2UserLeftGameMessageEvent(onUserLeft));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_215(onGameEnding));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_701(onRejoinGame));
            _local_2.addHabboConnectionMessageEvent(new Game2WeeklyLeaderboardEvent(onWeeklyLeaderboard));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_642(onStageStarting));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_999(onFullGameStatus));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_484(onRoomEnter));
            _local_2.addHabboConnectionMessageEvent(new Game2GameCancelledMessageEvent(onGameCancelled));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_263(onEnterArenaFailed));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_405(onUserJoined));
            _local_2.addHabboConnectionMessageEvent(new Game2TotalGroupLeaderboardEvent(onTotalGroupLeaderboard));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_340(onGameStatus));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_240(onArenaEntered));
            _local_2.addHabboConnectionMessageEvent(new Game2StartingGameFailedMessageEvent(onStartingGameFailed));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_249(onPlayerRematches));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_592(onStageStillLoading));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_400(onGameStarted));
            _local_2.addHabboConnectionMessageEvent(new Game2FriendsLeaderboardEvent(onFriendsLeaderboard));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_898(onGameChat));
            _local_2.addHabboConnectionMessageEvent(new Game2JoiningGameFailedMessageEvent(onJoiningGameFailed));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_848(onStageLoad));
            _local_2.addHabboConnectionMessageEvent(new Game2UserBlockedMessageEvent(onPlayerBlockStatusChange));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_388(onEnterArena));
            _local_2.addHabboConnectionMessageEvent(new Game2WeeklyFriendsLeaderboardEvent(onWeeklyFriendsLeaderboard));
        }

        public function dispose():void
        {
            _SafeStr_3758 = null;
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        private function onEnterArena(_arg_1:_SafeStr_388):void
        {
            var _local_3:_SafeStr_1434 = _arg_1.getParser();
            _SafeStr_3758.initArena(_local_3.gameType, _local_3.fieldType, _local_3.numberOfTeams, _local_3.players);
            var _local_2:SynchronizedGameArena = _SafeStr_3758.gameArena;
            var _local_4:_SafeStr_3309 = _local_2.getCurrentStage();
            _local_4.initialize(_SafeStr_3758.gameArena, _local_3.gameLevel);
            _SafeStr_3758.mainView.close(false);
        }

        private function onEnterArenaFailed(_arg_1:_SafeStr_263):void
        {
            var _local_2:_SafeStr_1472 = _arg_1.getParser();
            var _local_3:String = "snowwar.error.generic";
            switch (_local_2.reason)
            {
                case 1:
                    _local_3 = "snowwar.error.game_already_started";
                default:
                    _SafeStr_3758.alert((("${" + _local_3) + "}"));
                    return;
            };
        }

        private function onArenaEntered(_arg_1:_SafeStr_240):void
        {
            var _local_2:_SafeStr_1505 = _arg_1.getParser();
            var _local_3:Game2PlayerData = _local_2.player;
        }

        private function onStageLoad(_arg_1:_SafeStr_848):void
        {
            var _local_2:_SafeStr_1386 = _arg_1.getParser();
            _SafeStr_3758.initView();
        }

        private function onStageStillLoading(_arg_1:_SafeStr_592):void
        {
            var _local_2:_SafeStr_1240 = _arg_1.getParser();
            _SafeStr_3758.stageLoading(_local_2.percentage, _local_2.finishedPlayers);
        }

        private function onStageStarting(_arg_1:_SafeStr_642):void
        {
            var _local_3:_SafeStr_1321 = _arg_1.getParser();
            HabboGamesCom.log(("[HabbosnowWarEngine] On stage start: " + _local_3.countDown));
            var _local_2:GameObjectsData = _local_3.gameObjects;
            initializeGameObjects(_local_2);
            _SafeStr_3758.startStage(_local_3.countDown);
        }

        private function onStageRunning(_arg_1:_SafeStr_988):void
        {
            var _local_2:_SafeStr_1315 = _arg_1.getParser();
            HabboGamesCom.log(("[HabbosnowWarEngine] On stage running: " + _local_2.timeToStageEnd));
            _SafeStr_3758.stageRunning(_local_2.timeToStageEnd);
        }

        private function onStageEnding(_arg_1:_SafeStr_308):void
        {
            var _local_2:_SafeStr_1402 = _arg_1.getParser();
            HabboGamesCom.log(("[HabbosnowWarEngine] On stage ending: " + _local_2.timeToNextState));
            if (_local_2.timeToNextState == 0)
            {
                _SafeStr_3758.resetGameSession();
            };
        }

        private function onGameEnding(_arg_1:_SafeStr_215):void
        {
            var _local_2:_SafeStr_1158 = _arg_1.getParser();
            HabboGamesCom.log(("[HabbosnowWarEngine] On game ending: " + _local_2.timeToNextState));
            _SafeStr_3758.gameOver(_local_2.timeToNextState, _local_2.teams, _local_2.generalStats, _local_2.gameResult);
        }

        private function onPlayerExitedArena(_arg_1:_SafeStr_306):void
        {
            var _local_2:_SafeStr_1047 = _arg_1.getParser();
            HabboGamesCom.log(((("[HabbosnowWarEngine] On player exited arena. userId:" + _local_2.userId) + " gameObjectId:") + _local_2.playerGameObjectId));
        }

        private function onRejoinGame(_arg_1:_SafeStr_701):void
        {
            var _local_2:_SafeStr_1161 = _arg_1.getParser();
            HabboGamesCom.log(("Rejoin game! Room Before game: " + _local_2.roomBeforeGame));
            _SafeStr_3758.rejoinGame(_local_2.roomBeforeGame);
        }

        private function onPlayerRematches(_arg_1:_SafeStr_249):void
        {
            var _local_2:_SafeStr_1518 = _arg_1.getParser();
            HabboGamesCom.log((("User " + _local_2.userId) + " rematches"));
            _SafeStr_3758.playerRematches(_local_2.userId);
        }

        private function onGameDirectoryStatus(_arg_1:Game2GameDirectoryStatusMessageEvent):void
        {
            var _local_2:Game2GameDirectoryStatusMessageParser = _arg_1.getParser();
            if (_local_2.status == 0)
            {
                _SafeStr_3758.mainView.changeBlockStatus(_local_2.blockLength);
                _SafeStr_3758.gamesPlayed = _local_2.gamesPlayed;
                _SafeStr_3758.onGameDirectoryAvailable(true);
                _SafeStr_3758.gamesLeft(0, (_local_2.freeGamesLeft == -1), _local_2.freeGamesLeft);
            }
            else
            {
                _SafeStr_3758.onGameDirectoryAvailable(false);
                HabboGamesCom.log(("Game directory not available, status:" + _local_2.status));
            };
        }

        private function onAccountGameStatus(_arg_1:Game2AccountGameStatusMessageEvent):void
        {
            var _local_2:Game2AccountGameStatusMessageParser = _arg_1.getParser();
            HabboGamesCom.log(((("FREE GAMES LEFT: " + _local_2.freeGamesLeft) + " OR HAS UNLIMITED GAMES: ") + _local_2.hasUnlimitedGames));
            _SafeStr_3758.gamesLeft(_local_2.gameTypeId, _local_2.hasUnlimitedGames, _local_2.freeGamesLeft);
        }

        private function onGameCreated(_arg_1:_SafeStr_837):void
        {
            var _local_2:_SafeStr_1487 = _arg_1.getParser();
            var _local_3:GameLobbyData = _local_2.gameLobbyData;
            _SafeStr_3758.createLobby(_local_3);
        }

        private function onGameStarted(_arg_1:_SafeStr_400):void
        {
            var _local_2:_SafeStr_1427 = _arg_1.getParser();
            HabboGamesCom.log("Game started!");
            _SafeStr_3758.gameStarted(_local_2.lobbyData);
        }

        private function onLobbyCounterStart(_arg_1:Game2StartCounterMessageEvent):void
        {
            var _local_2:Game2StartCounterMessageParser = _arg_1.getParser();
            HabboGamesCom.log(("Start Lobby Counter: " + _local_2.countDownLength));
            _SafeStr_3758.startLobbyCounter(_local_2.countDownLength);
        }

        private function onLobbyCounterStop(_arg_1:Game2StopCounterMessageEvent):void
        {
            _SafeStr_3758.stopLobbyCounter();
        }

        private function onGameCancelled(_arg_1:Game2GameCancelledMessageEvent):void
        {
            _SafeStr_3758.gameCancelled(false);
        }

        private function onInArenaQueue(_arg_1:Game2InArenaQueueMessageEvent):void
        {
            var _local_2:Game2InArenaQueueMessageParser = _arg_1.getParser();
            if (_SafeStr_3758.lobbyView)
            {
                _SafeStr_3758.lobbyView.queuePosition = _local_2.position;
            };
        }

        private function onUserJoined(_arg_1:_SafeStr_405):void
        {
            var _local_2:_SafeStr_1116 = _arg_1.getParser();
            _SafeStr_3758.userJoined(_local_2.user);
        }

        private function onUserLeft(_arg_1:Game2UserLeftGameMessageEvent):void
        {
            var _local_2:Game2UserLeftGameMessageParser = _arg_1.getParser();
            _SafeStr_3758.userLeft(_local_2.userId);
        }

        private function onGameLongData(_arg_1:_SafeStr_667):void
        {
            var _local_2:_SafeStr_1187 = _arg_1.getParser();
            var _local_3:GameLobbyData = _local_2.gameLobbyData;
            HabboGamesCom.log(("Long data received: " + [_local_3.fieldType, _local_3.numberOfTeams, _local_3.maximumPlayers]));
            _SafeStr_3758.createLobby(_local_3);
        }

        private function onJoiningGameFailed(_arg_1:Game2JoiningGameFailedMessageEvent):void
        {
            var _local_2:Game2JoiningGameFailedMessageParser = _arg_1.getParser();
            var _local_3:String = "snowwar.error.generic";
            switch (_local_2.reason)
            {
                case 6:
                case 7:
                    _local_3 = "snowwar.error.has_active_instance";
                    break;
                case 8:
                    _local_3 = "snowwar.error.no_free_games_left";
                    break;
                case 2:
                    _local_3 = "snowwar.error.duplicate_machineid";
                default:
            };
            _SafeStr_3758.alert((("${" + _local_3) + "}"));
        }

        private function onStartingGameFailed(_arg_1:Game2StartingGameFailedMessageEvent):void
        {
            _SafeStr_3758.alert("${snowwar.error.generic}");
        }

        private function onPlayerBlockStatusChange(_arg_1:Game2UserBlockedMessageEvent):void
        {
            var _local_2:Game2UserBlockedMessageParser = _arg_1.getParser();
            _SafeStr_3758.mainView.changeBlockStatus(_local_2.playerBlockLength);
        }

        private function onFullGameStatus(_arg_1:_SafeStr_999):void
        {
            var _local_4:* = null;
            var _local_3:_SafeStr_1431 = _arg_1.getParser();
            var _local_2:SynchronizedGameArena = _SafeStr_3758.gameArena;
            HabboGamesCom.log("On full game status: ");
            var _local_5:FullGameStatusData = _local_3.fullStatus;
            (_local_2.getCurrentStage() as _SafeStr_3310).resetTiles();
            initializeGameObjects(_local_5.gameObjects);
            if (_local_2)
            {
                _local_4 = _local_5.gameStatus;
                _local_2.seekToTurn(_local_4.turn, _local_4.checksum);
                handleGameStatus(_local_4, true);
            };
        }

        private function onGameStatus(_arg_1:_SafeStr_340):void
        {
            var _local_2:_SafeStr_1452 = _arg_1.getParser();
            HabboGamesCom.log("[HabbosnowWarEngine] On game status: ");
            handleGameStatus(_local_2.status);
        }

        private function initializeGameObjects(_arg_1:GameObjectsData):void
        {
            var _local_4:* = null;
            var _local_8:Boolean;
            var _local_16:* = null;
            var _local_12:* = null;
            var _local_3:* = null;
            var _local_11:* = null;
            var _local_13:* = null;
            var _local_7:* = null;
            var _local_15:* = null;
            var _local_9:* = null;
            var _local_5:* = null;
            var _local_17:* = null;
            var _local_6:* = null;
            var _local_10:SynchronizedGameArena = _SafeStr_3758.gameArena;
            if (!_local_10)
            {
                return;
            };
            var _local_14:_SafeStr_3310 = (_local_10.getCurrentStage() as _SafeStr_3310);
            _local_14.removeAllGameObjects();
            for each (var _local_2:SnowWarGameObjectData in _arg_1.gameObjects)
            {
                switch (_local_2.type)
                {
                    case 5:
                        _local_4 = (_local_2 as HumanGameObjectData);
                        _local_8 = (_local_4.name == _SafeStr_3758.sessionDataManager.userName);
                        if (_local_8)
                        {
                            _SafeStr_3758.ownId = _local_4.id;
                        };
                        _local_16 = new HumanGameObject(_local_14, _local_4, false, _SafeStr_3758);
                        _local_14.addGameObject(_local_16.gameObjectId, _local_16);
                        _local_16.visualizationMode = 0;
                        if (((_local_8) && (_SafeStr_3758.isGhostEnabled)))
                        {
                            if (_SafeStr_3758.isGhostVisualizationEnabled)
                            {
                                _local_16.visualizationMode = 1;
                            }
                            else
                            {
                                _local_16.visualizationMode = 2;
                            };
                            if (_SafeStr_3758.gameArena.getCurrentStage().getGameObject(_local_16.ghostObjectId) == null)
                            {
                                _local_12 = new HumanGameObject(_local_14, _local_4, true, _SafeStr_3758);
                                _local_12.gameObjectId = _local_16.ghostObjectId;
                                _local_14.addGameObject(_local_12.gameObjectId, _local_12);
                            };
                        };
                        HabboGamesCom.log(((((("human id:" + _local_4.id) + " x:") + _local_4.currentLocationX) + " y:") + _local_4.currentLocationY));
                        break;
                    case 1:
                        _local_3 = (_local_2 as SnowballGameObjectData);
                        _local_11 = new SnowBallGameObject(_local_3.id);
                        _local_13 = (_local_14.getGameObject(_local_3.throwingHuman) as HumanGameObject);
                        _local_11.initializeFromData(_local_3, _local_13);
                        _local_14.addGameObject(_local_11.gameObjectId, _local_11);
                        HabboGamesCom.log(((("snowball x:" + _local_3.locationX3D) + " y:") + _local_3.locationY3D));
                        break;
                    case 4:
                        _local_7 = (_local_2 as SnowballMachineGameObjectData);
                        _local_15 = new SnowballMachineGameObject(_local_7, _local_14);
                        _local_14.addGameObject(_local_7.id, _local_15);
                        HabboGamesCom.log(("machine id:" + _local_7.id));
                        break;
                    case 3:
                        _local_9 = (_local_2 as SnowballPileGameObjectData);
                        _local_5 = new SnowballPileGameObject(_local_9, _local_14);
                        _local_14.addGameObject(_local_9.id, _local_5);
                        HabboGamesCom.log(("pile id:" + _local_9.id));
                        break;
                    case 2:
                        _local_17 = (_local_2 as TreeGameObjectData);
                        _local_6 = new TreeGameObject(_local_17, _local_14);
                        _local_14.addGameObject(_local_6.gameObjectId, _local_6);
                        HabboGamesCom.log(("tree id:" + _local_6.gameObjectId));
                        break;
                    default:
                        HabboGamesCom.log(("Unkonwn game-object:" + _local_2.type));
                };
            };
        }

        private function handleGameStatus(_arg_1:GameStatusData, _arg_2:Boolean=false):void
        {
            var _local_11:* = null;
            var _local_7:* = null;
            var _local_6:* = null;
            var _local_3:_SafeStr_24 = (_arg_1.events as _SafeStr_24);
            var _local_4:SynchronizedGameArena = _SafeStr_3758.gameArena;
            if (!_local_4)
            {
                return;
            };
            var _local_10:int = _arg_1.turn;
            for each (var _local_5:int in _local_3.getKeys())
            {
                _local_11 = (_local_3.getValue(_local_5) as Array);
                for each (var _local_9:SnowWarGameEventData in _local_11)
                {
                    switch (_local_9.id)
                    {
                        case 8:
                            _local_7 = handleCreateSnowballEvent((_local_9 as CreateSnowballEventData));
                            break;
                        case 12:
                            _local_7 = handleHumanGetsSnowballFromMachineEvent((_local_9 as HumanGetsSnowballsFromMachineEventData));
                            break;
                        case 7:
                            _local_7 = handleHumanStartsToMakeASnowball((_local_9 as HumanStartsToMakeASnowballEventData));
                            _local_6 = handleGhostStartsToMakeASnowball((_local_9 as HumanStartsToMakeASnowballEventData));
                            break;
                        case 11:
                            _local_7 = handleMachineCreatesSnowballEvent((_local_9 as MachineCreatesSnowballEventData));
                            break;
                        case 2:
                            _local_7 = handleNewMoveTargetEvent((_local_9 as NewMoveTargetEventData));
                            break;
                        case 3:
                            _local_7 = handleThrowSnowballAtHuman((_local_9 as HumanThrowsSnowballAtHumanEventData));
                            _local_6 = handleGhostThrowSnowballAtHuman((_local_9 as HumanThrowsSnowballAtHumanEventData));
                            break;
                        case 4:
                            _local_7 = handleThrowSnowballAtPosition((_local_9 as HumanThrowsSnowballAtPositionEventData));
                            _local_6 = handleGhostThrowSnowballAtPosition((_local_9 as HumanThrowsSnowballAtPositionEventData));
                            break;
                        case 1:
                            _local_7 = handleHumanLeftGameEvent((_local_9 as HumanLeftGameEventData));
                            break;
                        default:
                            HabboGamesCom.log(("Unknown event id " + _local_9.id));
                    };
                    if (_local_7)
                    {
                        _local_4.addGameEvent((_local_10 + 1), _local_5, _local_7);
                    };
                    if (_local_6)
                    {
                        _local_4.addGameEvent((_local_10 + 1), _local_5, _local_6);
                    };
                };
            };
            var _local_8:int = _arg_1.checksum;
            _SafeStr_3758.nextTurn(_local_10, _local_8, _arg_2);
        }

        private function handleHumanGetsSnowballFromMachineEvent(_arg_1:HumanGetsSnowballsFromMachineEventData):HumanGetsSnowballsFromMachineEvent
        {
            var _local_2:SynchronizedGameArena = _SafeStr_3758.gameArena;
            var _local_3:_SafeStr_3309 = _local_2.getCurrentStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(_arg_1.humanGameObjectId) as HumanGameObject);
            var _local_5:SnowballGivingGameObject = (_local_3.getGameObject(_arg_1.snowBallMachineReference) as SnowballGivingGameObject);
            return (new HumanGetsSnowballsFromMachineEvent(_local_4, _local_5));
        }

        private function handleMachineCreatesSnowballEvent(_arg_1:MachineCreatesSnowballEventData):MachineCreatesSnowballEvent
        {
            var _local_2:SynchronizedGameArena = _SafeStr_3758.gameArena;
            var _local_3:_SafeStr_3309 = _local_2.getCurrentStage();
            var _local_4:SnowballMachineGameObject = (_local_3.getGameObject(_arg_1.snowBallMachineReference) as SnowballMachineGameObject);
            return (new MachineCreatesSnowballEvent(_local_4));
        }

        private function handleThrowSnowballAtPosition(_arg_1:HumanThrowsSnowballAtPositionEventData):HumanThrowsSnowballAtPositionEvent
        {
            var _local_2:SynchronizedGameArena = _SafeStr_3758.gameArena;
            var _local_3:_SafeStr_3309 = _local_2.getCurrentStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(_arg_1.humanGameObjectId) as HumanGameObject);
            return (new HumanThrowsSnowballAtPositionEvent(_local_4, _arg_1.targetX, _arg_1.targetY, _arg_1.trajectory));
        }

        private function handleThrowSnowballAtHuman(_arg_1:HumanThrowsSnowballAtHumanEventData):HumanThrowsSnowballAtHumanEvent
        {
            var _local_3:SynchronizedGameArena = _SafeStr_3758.gameArena;
            var _local_4:_SafeStr_3309 = _local_3.getCurrentStage();
            var _local_5:HumanGameObject = (_local_4.getGameObject(_arg_1.humanGameObjectId) as HumanGameObject);
            var _local_2:HumanGameObject = (_local_4.getGameObject(_arg_1.targetHumanGameObjectId) as HumanGameObject);
            return (new HumanThrowsSnowballAtHumanEvent(_local_5, _local_2, _arg_1.trajectory));
        }

        private function handleHumanStartsToMakeASnowball(_arg_1:HumanStartsToMakeASnowballEventData):HumanStartsToMakeASnowballEvent
        {
            var _local_2:SynchronizedGameArena = _SafeStr_3758.gameArena;
            var _local_3:_SafeStr_3309 = _local_2.getCurrentStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(_arg_1.humanGameObjectId) as HumanGameObject);
            return (new HumanStartsToMakeASnowballEvent(_local_4));
        }

        private function handleCreateSnowballEvent(_arg_1:CreateSnowballEventData):CreateSnowballEvent
        {
            var _local_2:SynchronizedGameArena = _SafeStr_3758.gameArena;
            var _local_3:_SafeStr_3309 = _local_2.getCurrentStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(_arg_1.humanGameObjectId) as HumanGameObject);
            return (new CreateSnowballEvent(_arg_1.snowBallGameObjectId, _local_4, _arg_1.targetX, _arg_1.targetY, _arg_1.trajectory));
        }

        private function handleNewMoveTargetEvent(_arg_1:NewMoveTargetEventData):NewMoveTargetEvent
        {
            var _local_2:SynchronizedGameArena = _SafeStr_3758.gameArena;
            var _local_3:_SafeStr_3309 = _local_2.getCurrentStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(_arg_1.humanGameObjectId) as HumanGameObject);
            return (new NewMoveTargetEvent(_local_4, _arg_1.x, _arg_1.y));
        }

        private function handleHumanLeftGameEvent(_arg_1:HumanLeftGameEventData):HumanLeftGameEvent
        {
            var _local_2:SynchronizedGameArena = _SafeStr_3758.gameArena;
            var _local_3:_SafeStr_3309 = _local_2.getCurrentStage();
            var _local_4:HumanGameObject = (_local_3.getGameObject(_arg_1.humanGameObjectId) as HumanGameObject);
            return (new HumanLeftGameEvent(_local_4));
        }

        private function handleGhostThrowSnowballAtPosition(_arg_1:HumanThrowsSnowballAtPositionEventData):HumanThrowsSnowballAtPositionEvent
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (_SafeStr_3758.isGhostEnabled)
            {
                _local_2 = _SafeStr_3758.gameArena;
                _local_3 = _local_2.getCurrentStage();
                if (_arg_1.humanGameObjectId == _SafeStr_3758.ownId)
                {
                    return (new HumanThrowsSnowballAtPositionEvent(_SafeStr_3758.getGhostPlayer(), _arg_1.targetX, _arg_1.targetY, _arg_1.trajectory));
                };
            };
            return (null);
        }

        private function handleGhostThrowSnowballAtHuman(_arg_1:HumanThrowsSnowballAtHumanEventData):HumanThrowsSnowballAtHumanEvent
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:* = null;
            if (_SafeStr_3758.isGhostEnabled)
            {
                _local_3 = _SafeStr_3758.gameArena;
                _local_4 = _local_3.getCurrentStage();
                _local_2 = (_local_4.getGameObject(_arg_1.targetHumanGameObjectId) as HumanGameObject);
                if (_arg_1.humanGameObjectId == _SafeStr_3758.ownId)
                {
                    return (new HumanThrowsSnowballAtHumanEvent(_SafeStr_3758.getGhostPlayer(), _local_2, _arg_1.trajectory));
                };
            };
            return (null);
        }

        private function handleGhostStartsToMakeASnowball(_arg_1:HumanStartsToMakeASnowballEventData):HumanStartsToMakeASnowballEvent
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            if (_SafeStr_3758.isGhostEnabled)
            {
                _local_2 = _SafeStr_3758.gameArena;
                _local_3 = _local_2.getCurrentStage();
                _local_4 = (_local_3.getGameObject(_arg_1.humanGameObjectId) as HumanGameObject);
                if (_arg_1.humanGameObjectId == _SafeStr_3758.ownId)
                {
                    return (new HumanStartsToMakeASnowballEvent(_SafeStr_3758.getGhostPlayer()));
                };
            };
            return (null);
        }

        private function onGameChat(_arg_1:_SafeStr_898):void
        {
            var _local_2:_SafeStr_1297 = _arg_1.getParser();
            _SafeStr_3758.addChatMessage(_local_2.userId, _local_2.chatMessage);
        }

        private function onSubscriptionStatus(_arg_1:_SafeStr_990):void
        {
            if (_SafeStr_3758 != null)
            {
                _SafeStr_3758.send(new Game2GetAccountGameStatusMessageComposer(0));
                if (_SafeStr_3758.mainView.gameLobbyWindowActive)
                {
                    return;
                };
                if (!_SafeStr_3758.gameCenterEnabled)
                {
                    _SafeStr_3758.mainView.openMainWindow(false);
                };
            };
        }

        private function onRoomEnter(_arg_1:_SafeStr_484):void
        {
            _SafeStr_3758.promoteGame();
        }

        private function onFriendsLeaderboard(_arg_1:Game2FriendsLeaderboardEvent):void
        {
            var _local_2:Game2LeaderboardParser = _arg_1.getParser();
            if (_SafeStr_3758.leaderboard)
            {
                _SafeStr_3758.leaderboard.addFriendAllTimeData(_local_2.leaderboard, _local_2.totalListSize);
            };
        }

        private function onTotalLeaderboard(_arg_1:Game2TotalLeaderboardEvent):void
        {
            var _local_2:Game2LeaderboardParser = _arg_1.getParser();
            if (_SafeStr_3758.leaderboard)
            {
                _SafeStr_3758.leaderboard.addAllTimeData(_local_2.leaderboard, _local_2.totalListSize);
            };
        }

        private function onTotalGroupLeaderboard(_arg_1:Game2TotalGroupLeaderboardEvent):void
        {
            var _local_2:Game2GroupLeaderboardParser = _arg_1.getParser();
            if (_SafeStr_3758.leaderboard)
            {
                _SafeStr_3758.leaderboard.addAllTimeGroupData(_local_2.leaderboard, _local_2.totalListSize, _local_2.favouriteGroupId);
            };
        }

        private function onWeeklyGroupLeaderboard(_arg_1:Game2WeeklyGroupLeaderboardEvent):void
        {
            var _local_2:Game2WeeklyGroupLeaderboardParser = _arg_1.getParser();
            if (_SafeStr_3758.leaderboard)
            {
                _SafeStr_3758.leaderboard.addWeeklyGroupData(_local_2.year, _local_2.week, _local_2.leaderboard, _local_2.totalListSize, _local_2.maxOffset, _local_2.minutesUntilReset, _local_2.favouriteGroupId);
            };
        }

        private function onWeeklyLeaderboard(_arg_1:Game2WeeklyLeaderboardEvent):void
        {
            var _local_2:Game2WeeklyLeaderboardParser = _arg_1.getParser();
            if (_SafeStr_3758.leaderboard)
            {
                _SafeStr_3758.leaderboard.addWeeklyData(_local_2.year, _local_2.week, _local_2.leaderboard, _local_2.totalListSize, _local_2.maxOffset, _local_2.minutesUntilReset);
            };
        }

        private function onWeeklyFriendsLeaderboard(_arg_1:Game2WeeklyFriendsLeaderboardEvent):void
        {
            var _local_2:Game2WeeklyLeaderboardParser = _arg_1.getParser();
            if (_SafeStr_3758.leaderboard)
            {
                _SafeStr_3758.leaderboard.addFriendWeeklyData(_local_2.year, _local_2.week, _local_2.leaderboard, _local_2.totalListSize, _local_2.maxOffset, _local_2.minutesUntilReset);
            };
        }


    }
}//package com.sulake.habbo.game.snowwar

// _SafeStr_1047 = "_-Z4" (String#31908, DoABC#4)
// _SafeStr_1116 = "_-L5" (String#39848, DoABC#4)
// _SafeStr_1158 = "_-QA" (String#39363, DoABC#4)
// _SafeStr_1161 = "_-31m" (String#32625, DoABC#4)
// _SafeStr_1187 = "_-gk" (String#32323, DoABC#4)
// _SafeStr_1240 = "_-n8" (String#32441, DoABC#4)
// _SafeStr_1297 = "_-21O" (String#34262, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1315 = "_-s1u" (String#34284, DoABC#4)
// _SafeStr_1321 = "_-e1s" (String#29040, DoABC#4)
// _SafeStr_1386 = "_-l1t" (String#40429, DoABC#4)
// _SafeStr_1402 = "_-L1w" (String#39162, DoABC#4)
// _SafeStr_1427 = "_-a1R" (String#37093, DoABC#4)
// _SafeStr_1431 = "_-nb" (String#32164, DoABC#4)
// _SafeStr_1434 = "_-qx" (String#31650, DoABC#4)
// _SafeStr_1452 = "_-O1X" (String#41024, DoABC#4)
// _SafeStr_1472 = "_-Mo" (String#39338, DoABC#4)
// _SafeStr_1487 = "_-5Q" (String#38619, DoABC#4)
// _SafeStr_1505 = "_-a19" (String#37156, DoABC#4)
// _SafeStr_1518 = "_-Js" (String#39849, DoABC#4)
// _SafeStr_215 = "_-xV" (String#24583, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_240 = "_-h1X" (String#23490, DoABC#4)
// _SafeStr_249 = "_-h1a" (String#23582, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_263 = "_-12c" (String#24757, DoABC#4)
// _SafeStr_306 = "_-zK" (String#24513, DoABC#4)
// _SafeStr_308 = "_-C1s" (String#28291, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_340 = "_-a1u" (String#28058, DoABC#4)
// _SafeStr_3758 = "_-B1R" (String#966, DoABC#4)
// _SafeStr_388 = "_-T1y" (String#26087, DoABC#4)
// _SafeStr_400 = "_-cw" (String#15162, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_405 = "_-dl" (String#23868, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_592 = "_-s1U" (String#22899, DoABC#4)
// _SafeStr_642 = "_-kN" (String#13461, DoABC#4)
// _SafeStr_667 = "_-41P" (String#24423, DoABC#4)
// _SafeStr_701 = "_-qj" (String#23439, DoABC#4)
// _SafeStr_837 = "_-Q1x" (String#27151, DoABC#4)
// _SafeStr_848 = "_-A11" (String#26567, DoABC#4)
// _SafeStr_898 = "_-51z" (String#23516, DoABC#4)
// _SafeStr_988 = "_-B1F" (String#27014, DoABC#4)
// _SafeStr_990 = "_-D1i" (String#4238, DoABC#4)
// _SafeStr_999 = "_-c15" (String#27544, DoABC#4)


