// by nota

//com.sulake.habbo.game.snowwar.ui.GameEndingViewController

package com.sulake.habbo.game.snowwar.ui
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2GameResult;
    import flash.utils.Timer;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2TeamScoreData;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.game.snowwar.utils.WindowUtils;
    import _-81Y.Game2GetAccountGameStatusMessageComposer;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2SnowWarGameStats;
    import com.sulake.habbo.game.snowwar.utils.SnowWarAnimatedWindowElement;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-81Y._SafeStr_611;
    import _-M1k._SafeStr_525;
    import _-PD.Game2ExitGameMessageComposer;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2TeamPlayerData;
    import com.sulake.core.window.components.IItemListWindow;
    import _-qv._SafeStr_895;
    import com.sulake.habbo.avatar._SafeStr_3164;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import flash.display.BitmapData;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.events.TimerEvent;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.geom.Point;

    public class GameEndingViewController implements _SafeStr_13, _SafeStr_1875 
    {

        private static const NUMBER_OF_TEAMS:uint = 2;
        private static const STATE_RESULTS:int = 0;
        private static const STATE_RESULTS_PENDING_REMATCH:int = 1;
        private static const STATE_WAITING:int = 2;
        private static const STATE_LOBBY:int = 3;
        private static const STATE_LOADING:int = 4;
        private static const STATE_AFTER_SKI:int = 5;
        private static const _SafeStr_8600:int = 1;

        private var _window:_SafeStr_3133;
        private var _SafeStr_5466:SnowWarEngine;
        private var _SafeStr_4036:Boolean = false;
        private var _teams:Array;
        private var _players:Dictionary;
        private var _SafeStr_6231:BackgroundViewController;
        private var _SafeStr_6232:Game2GameResult;
        private var _SafeStr_5519:Timer;
        private var _SafeStr_4002:int = 0;
        private var _SafeStr_3734:int = 0;
        private var _lobbyPlayers:_SafeStr_24;
        private var _SafeStr_6233:_SafeStr_24;
        private var _SafeStr_6234:int = 1;

        public function GameEndingViewController(_arg_1:SnowWarEngine, _arg_2:Array, _arg_3:Game2SnowWarGameStats, _arg_4:Game2GameResult, _arg_5:int)
        {
            _teams = _arg_2;
            _players = new Dictionary();
            _SafeStr_5466 = _arg_1;
            _SafeStr_6232 = _arg_4;
            _SafeStr_6233 = new _SafeStr_24();
            _arg_1.roomUI.visible = false;
            _arg_1.windowManager.getDesktop(1).visible = false;
            _SafeStr_6231 = new BackgroundViewController(_SafeStr_5466);
            _SafeStr_6231.background.visible = true;
            createMainView();
            for each (var _local_6:Game2TeamScoreData in _arg_2)
            {
                addTeamScores(_local_6);
            };
            var _local_7:ITextWindow = (getElement(_window, "endingInformation") as ITextWindow);
            if (_SafeStr_6232.resultType == 2)
            {
                WindowUtils.colorStrokes(_local_7.parent, getNeutralTeamColor());
                WindowUtils.setCaption(_local_7, "${snowwar.result.tie}");
            }
            else
            {
                WindowUtils.colorStrokes(_local_7.parent, getTeamColor(_SafeStr_6232.winnerId));
                WindowUtils.setCaption(_local_7, (("${snowwar.team_" + _SafeStr_6232.winnerId) + "_wins}"));
            };
            showMostHits(_arg_3.playerWithMostHits);
            showMostKills(_arg_3.playerWithMostKills);
            startResultsCountDown(_arg_5);
            if (_SafeStr_5466.hasUnlimitedGames)
            {
                WindowUtils.hideElement(_window, "statusContainer");
            }
            else
            {
                WindowUtils.showElement(_window, "statusContainer");
                _SafeStr_5466.communication.connection.send(new Game2GetAccountGameStatusMessageComposer(0));
            };
            updateGamesLeft();
        }

        public function dispose():void
        {
            _SafeStr_5466.windowManager.getDesktop(1).visible = true;
            disposeCountDownTimer();
            if (_SafeStr_6233)
            {
                for each (var _local_1:SnowWarAnimatedWindowElement in _SafeStr_6233)
                {
                    _local_1.dispose();
                };
                _SafeStr_6233.dispose();
                _SafeStr_6233 = null;
            };
            if (_SafeStr_6231)
            {
                _SafeStr_6231.dispose();
                _SafeStr_6231 = null;
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            _teams = null;
            _players = null;
            _SafeStr_6232 = null;
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        private function createMainView():void
        {
            _window = (WindowUtils.createWindow("snowwar_ending") as _SafeStr_3133);
            _window.x = ((_window.desktop.width - _window.width) / 2);
            _window.y = ((_window.desktop.height > 685) ? 115 : 10);
            _window.findChildByName("leave_link_region").procedure = onCancel;
            _window.findChildByName("button_rematch").addEventListener("WME_CLICK", onJoinRematch);
            _window.findChildByName("button_play_again").addEventListener("WME_CLICK", onPlayAgain);
            _window.findChildByName("button_buy_games").addEventListener("WME_CLICK", onBuyMoreGames);
            _window.findChildByName("loadingContainer").visible = false;
            _window.findChildByName("statusContainer").addEventListener("WME_CLICK", onGetMore);
        }

        private function onJoinRematch(_arg_1:WindowMouseEvent=null, _arg_2:_SafeStr_3109=null):void
        {
            var _local_3:* = null;
            if (_SafeStr_5466.freeGamesLeft == 0)
            {
                onGetMore(_arg_1);
            }
            else
            {
                _SafeStr_3734 = 1;
                _SafeStr_5466.sendRejoinGame();
                _local_3 = _window.findChildByName("button_rematch");
                _local_3.color = 0xCCCCCC;
                _local_3.disable();
                _window.findChildByName("statusContainer").visible = false;
            };
        }

        private function onPlayAgain(_arg_1:_SafeStr_3116=null, _arg_2:_SafeStr_3109=null):void
        {
            _SafeStr_5466.startQuickServerGame();
            _window.findChildByName("button_play_again").visible = false;
            _window.findChildByName("statusContainer").visible = false;
        }

        private function onBuyMoreGames(_arg_1:WindowMouseEvent):void
        {
            onGetMore(_arg_1);
        }

        private function updateGettingMoreGamesOption():void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName("button_rematch");
            var _local_1:_SafeStr_3109 = _window.findChildByName("button_buy_games");
            var _local_3:_SafeStr_3109 = _window.findChildByName("status.text_get_vip");
            var _local_4:_SafeStr_3109 = _window.findChildByName("status.text_get_more_games");
            _local_2.visible = false;
            _local_1.visible = false;
            _local_3.visible = false;
            _local_4.visible = false;
            switch (_SafeStr_6234)
            {
                case 1:
                    if (_SafeStr_5466.freeGamesLeft == 0)
                    {
                        _local_1.visible = true;
                    }
                    else
                    {
                        _local_2.visible = true;
                    };
                    _local_4.visible = true;
                    return;
                default:
                    _local_2.visible = true;
                    _local_3.visible = true;
            };
        }

        private function onCancel(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            onClose(true);
        }

        public function onClose(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                _SafeStr_5466.gameCancelled(true);
                if (((_SafeStr_3734 == 3) || (_SafeStr_3734 == 2)))
                {
                    _SafeStr_5466.communication.connection.send(new _SafeStr_611());
                    if (_SafeStr_5466.roomBeforeGame > -1)
                    {
                        _SafeStr_5466.communication.connection.send(new _SafeStr_525(_SafeStr_5466.roomBeforeGame, false, true));
                    };
                }
                else
                {
                    if (_SafeStr_3734 == 5)
                    {
                        if (_SafeStr_5466.roomBeforeGame > -1)
                        {
                            _SafeStr_5466.communication.connection.send(new _SafeStr_525(_SafeStr_5466.roomBeforeGame, false, true));
                        }
                        else
                        {
                            _SafeStr_5466.communication.connection.send(new Game2ExitGameMessageComposer());
                        };
                    }
                    else
                    {
                        _SafeStr_5466.communication.connection.send(new Game2ExitGameMessageComposer());
                    };
                };
                disposeCountDownTimer();
            };
        }

        private function disposeCountDownTimer():void
        {
            if (_SafeStr_5519)
            {
                _SafeStr_5519.removeEventListener("timer", onTick);
                _SafeStr_5519.stop();
                _SafeStr_5519 = null;
                _SafeStr_4002 = 0;
            };
        }

        private function addTeamScores(_arg_1:Game2TeamScoreData):void
        {
            var _local_2:int = _arg_1.teamReference;
            for each (var _local_3:Game2TeamPlayerData in _arg_1.players)
            {
                addPlayerScore(_local_3);
            };
            WindowUtils.setCaption(getElement(_window, (("team" + _local_2) + "Score")), _arg_1.score.toString());
        }

        private function addPlayerScore(_arg_1:Game2TeamPlayerData):void
        {
            _players[_arg_1.userId] = _arg_1;
            var _local_6:IItemListWindow = (_window.findChildByName((("team" + _arg_1.teamId) + "PlayersList")) as IItemListWindow);
            var _local_5:IItemListWindow = (WindowUtils.createWindow(("snowwar_results_player_team_" + _arg_1.teamId)) as IItemListWindow);
            var _local_7:_SafeStr_3133 = (_local_5.getListItemByName("playerImageContainer") as _SafeStr_3133);
            var _local_4:_SafeStr_3133 = (_local_5.getListItemByName("playerDataContainer") as _SafeStr_3133);
            var _local_2:_SafeStr_3133 = (_local_5.getListItemByName("playerScoreContainer") as _SafeStr_3133);
            WindowUtils.setElementImage(getElement(_local_7, "playerImage"), getAvatarFigure(_arg_1.teamId, _arg_1.figure, _arg_1.gender), 0, 0, 0);
            WindowUtils.setCaption(getElement(_local_4, "playerName"), _arg_1.userName);
            WindowUtils.hideElement(_local_4, "playerTotalStats");
            WindowUtils.setCaption(getElement(_local_4, "playerHits"), _arg_1.playerStats.snowballHits.toString());
            WindowUtils.setCaption(getElement(_local_4, "playerKills"), _arg_1.playerStats.kills.toString());
            WindowUtils.setCaption(getElement(_local_2, "playerScore"), _arg_1.score.toString());
            var _local_3:_SafeStr_3133 = (_local_7.findChildByName("addFriend") as _SafeStr_3133);
            if (((_SafeStr_5466.friendList.canBeAskedForAFriend(_arg_1.userId)) && (!(_arg_1.userId == _SafeStr_5466.sessionDataManager.userId))))
            {
                _local_3.id = _arg_1.userId;
                _local_3.getChildAt(0).id = _arg_1.teamId;
                _local_3.addEventListener("WME_CLICK", onAddFriendClick);
                _local_3.addEventListener("WME_OVER", onAddFriendOver);
                _local_3.addEventListener("WME_OUT", onAddFriendOut);
                _local_3.visible = true;
            };
            _local_6.addListItem(_local_5);
            _local_5.name = ("player" + _arg_1.userId);
        }

        private function onAddFriendClick(_arg_1:WindowMouseEvent):void
        {
            var _local_2:int = _arg_1.window.id;
            var _local_3:Game2TeamPlayerData = _players[_local_2];
            if (_local_3)
            {
                _SafeStr_5466.friendList.askForAFriend(_local_2, _local_3.userName);
                _SafeStr_5466.communication.connection.send(new _SafeStr_895("GameFramework", "SnowStorm", "gameFramework.sendFriendRequest.rematchView"));
                _SafeStr_5466.addChatMessage(_local_2, "${snowwar.friend_request.sent}", true);
            };
            _arg_1.window.visible = false;
        }

        private function onAddFriendOver(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3109 = (_arg_1.window as _SafeStr_3133).getChildAt(0);
            WindowUtils.setElementImage(_local_2, getBitmap("add_friend_icon_green"));
        }

        private function onAddFriendOut(_arg_1:WindowMouseEvent):void
        {
            var _local_2:_SafeStr_3109 = (_arg_1.window as _SafeStr_3133).getChildAt(0);
            var _local_3:String = ("add_friend_icon_" + ((_local_2.id == 1) ? "blue" : "red"));
            WindowUtils.setElementImage(_local_2, getBitmap(_local_3));
        }

        private function showMostHits(_arg_1:int):void
        {
            var _local_3:Game2TeamPlayerData = _players[_arg_1];
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3133 = (_window.findChildByName("mostHitsContainer") as _SafeStr_3133);
            if (_local_3.playerStats.snowballHits == 0)
            {
                _local_2.visible = false;
                return;
            };
            WindowUtils.setElementImage(getElement(_local_2, "backgroundImage"), getBitmap(getPlayerImageBackground(_local_3.teamId)));
            WindowUtils.setElementImage(getElement(_local_2, "playerImage"), getAvatarFigure(_local_3.teamId, _local_3.figure, _local_3.gender), 0, 0, 0);
            WindowUtils.setCaption(getElement(_local_2, "playerName"), _local_3.userName);
            WindowUtils.colorStrokes(_local_2, getTeamColor(_local_3.teamId));
        }

        private function showMostKills(_arg_1:int):void
        {
            var _local_3:Game2TeamPlayerData = _players[_arg_1];
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3133 = (_window.findChildByName("mostKillsContainer") as _SafeStr_3133);
            if (_local_3.playerStats.kills == 0)
            {
                _local_2.visible = false;
                return;
            };
            WindowUtils.setElementImage(getElement(_local_2, "backgroundImage"), getBitmap(getPlayerImageBackground(_local_3.teamId)));
            WindowUtils.setElementImage(getElement(_local_2, "playerImage"), getAvatarFigure(_local_3.teamId, _local_3.figure, _local_3.gender), 0, 0, 0);
            WindowUtils.setCaption(getElement(_local_2, "playerName"), _local_3.userName);
            WindowUtils.colorStrokes(_local_2, getTeamColor(_local_3.teamId));
        }

        private function getPlayerImageBackground(_arg_1:int):String
        {
            var _local_2:* = null;
            switch (_arg_1)
            {
                case 1:
                    _local_2 = "blue_square";
                    break;
                case 2:
                    _local_2 = "red_square";
                    break;
                default:
                    _local_2 = "blue_square";
            };
            return (_local_2);
        }

        private function getNeutralTeamColor():uint
        {
            return (8227482);
        }

        private function getTeamColor(_arg_1:int):uint
        {
            switch (_arg_1)
            {
                case 1:
                    return (4279269292);
                case 2:
                    return (4294797401);
                default:
                    return (4279269292);
            };
        }

        private function getTeamPlayerDirection(_arg_1:int):uint
        {
            switch (_arg_1)
            {
                case 1:
                    return (2);
                case 2:
                    return (4);
                default:
                    return (2);
            };
        }

        private function getAvatarFigure(_arg_1:int, _arg_2:String, _arg_3:String):BitmapData
        {
            var _local_4:_SafeStr_3164 = _SafeStr_5466.avatarManager.createFigureContainer(_arg_2);
            switch (_arg_1)
            {
                case 1:
                    _local_4.updatePart("ch", 20000, [1]);
                    break;
                case 2:
                    _local_4.updatePart("ch", 20001, [1]);
                    break;
                default:
                    _local_4.updatePart("ch", 20000, [1]);
            };
            _local_4.removePart("cc");
            var _local_5:_SafeStr_3138 = _SafeStr_5466.avatarManager.createAvatarImage(_local_4.getFigureString(), "h_50", _arg_3, this);
            if (_local_5)
            {
                _local_5.setDirection("full", getTeamPlayerDirection(_arg_1));
                return (_local_5.getCroppedImage("full"));
            };
            return (null);
        }

        private function getElement(_arg_1:_SafeStr_3133, _arg_2:String):_SafeStr_3109
        {
            return ((_arg_1 != null) ? _arg_1.findChildByName(_arg_2) : null);
        }

        private function getBitmap(_arg_1:String):BitmapData
        {
            var _local_2:IAsset = _SafeStr_5466.assets.getAssetByName(_arg_1);
            if (_local_2)
            {
                return (_local_2.content as BitmapData);
            };
            return (null);
        }

        public function avatarImageReady(_arg_1:String):void
        {
        }

        public function playerRematches(_arg_1:int):void
        {
            var _local_5:* = null;
            var _local_3:IItemListWindow = (_window.findChildByName(("player" + _arg_1)) as IItemListWindow);
            if (_local_3 == null)
            {
                return;
            };
            var _local_6:Game2TeamPlayerData = _players[_arg_1];
            if (_local_6 == null)
            {
                return;
            };
            _local_6.willRejoin = true;
            var _local_2:_SafeStr_3133 = (_local_3.getListItemByName("playerScoreContainer") as _SafeStr_3133);
            var _local_4:_SafeStr_3264 = (getElement(_local_2, "playerScoreGlow") as _SafeStr_3264);
            if (!_SafeStr_6233.hasKey(_local_4))
            {
                _local_5 = new SnowWarAnimatedWindowElement(_SafeStr_5466.assets, _local_4, "rematch_", 6, 100, true);
                _SafeStr_6233.add(_local_4, _local_5);
            };
        }

        public function changeToWaitState(_arg_1:Boolean):void
        {
            var _local_6:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:* = null;
            if (!_arg_1)
            {
                return (changeToAfterSkiState());
            };
            _SafeStr_3734 = 2;
            stopResultsCountDown();
            var _local_5:Array = [];
            for each (var _local_8:Game2TeamPlayerData in _players)
            {
                _local_6 = (_window.findChildByName((("team" + _local_8.teamId) + "PlayersList")) as IItemListWindow);
                _local_3 = (_window.findChildByName(("player" + _local_8.userId)) as IItemListWindow);
                if (_local_3 == null)
                {
                    return;
                };
                if (!_local_8.willRejoin)
                {
                    _local_6.removeListItem(_local_3);
                    _local_5.push(_local_8.userId);
                }
                else
                {
                    _local_4 = (_local_3.getListItemByName("playerDataContainer") as _SafeStr_3133);
                    _local_2 = (_local_3.getListItemByName("playerScoreContainer") as _SafeStr_3133);
                    _local_4.findChildByName("playerStats").visible = false;
                    WindowUtils.setCaption(getElement(_local_4, "playerName"), _local_8.userName);
                    WindowUtils.hideElement(_local_2, "playerScore");
                };
            };
            for each (var _local_7:int in _local_5)
            {
                delete _players[_local_7];
            };
            WindowUtils.hideElement(_window, "buttonsContainer");
            WindowUtils.hideElement(_window, "mostKillsContainer");
            WindowUtils.hideElement(_window, "mostHitsContainer");
            WindowUtils.hideElement(_window, "team1Score");
            WindowUtils.hideElement(_window, "team2Score");
            WindowUtils.setCaption(getElement(_window, "endingInformation"), "${snowwar.lobby_waiting_for_more_players}");
        }

        private function changeToAfterSkiState():void
        {
            _SafeStr_3734 = 5;
            if (_SafeStr_6233)
            {
                for each (var _local_2:SnowWarAnimatedWindowElement in _SafeStr_6233)
                {
                    _local_2.dispose();
                };
                _SafeStr_6233.reset();
            };
            hideChatInput();
            if (_SafeStr_5466.freeGamesLeft == 0)
            {
                return;
            };
            _window.findChildByName("button_rematch").visible = false;
            _window.findChildByName("button_play_again").visible = true;
            var _local_1:_SafeStr_3109 = _window.findChildByName("button_play_again");
            _local_1.enable();
            _local_1.color = 0x55CC00;
        }

        private function updateDialog():void
        {
            if (_SafeStr_4036)
            {
                return;
            };
            var _local_1:ITextWindow = (_window.findChildByName("endingInformation") as ITextWindow);
            var _local_2:ITextWindow = (_window.findChildByName("endingInformation_stroke") as ITextWindow);
            _local_1.fontSize = 28;
            _local_2.fontSize = 28;
            if (_SafeStr_5466.freeGamesLeft == 0)
            {
                WindowUtils.setCaption(getElement(_window, "button_rematch"), "${catalog.vip.buy.title}");
            }
            else
            {
                if (_SafeStr_3734 == 0)
                {
                    _SafeStr_5466.localization.registerParameter("snowwar.rematch", "seconds", _SafeStr_4002.toString());
                    WindowUtils.setCaption(getElement(_window, "button_rematch"), "${snowwar.rematch}");
                }
                else
                {
                    if (_SafeStr_3734 == 1)
                    {
                        _SafeStr_5466.localization.registerParameter("snowwar.please_wait", "seconds", _SafeStr_4002.toString());
                        WindowUtils.setCaption(getElement(_window, "button_rematch"), "${snowwar.please_wait}");
                    }
                    else
                    {
                        if (_SafeStr_3734 == 3)
                        {
                            _SafeStr_5466.localization.registerParameter("snowwar.lobby_game_start_countdown", "seconds", _SafeStr_4002.toString());
                            WindowUtils.setCaption(getElement(_window, "endingInformation"), "${snowwar.lobby_game_start_countdown}");
                            _local_1.fontSize = 22;
                            _local_2.fontSize = 22;
                        }
                        else
                        {
                            if (_SafeStr_3734 == 2)
                            {
                                WindowUtils.setCaption(getElement(_window, "endingInformation"), "${snowwar.lobby_waiting_for_more_players}");
                                _local_1.fontSize = 22;
                                _local_2.fontSize = 22;
                            };
                        };
                    };
                };
            };
        }

        private function startCountDownTimer(_arg_1:int):void
        {
            disposeCountDownTimer();
            _SafeStr_5519 = new Timer(1000, _arg_1);
            _SafeStr_5519.addEventListener("timer", onTick);
            _SafeStr_5519.start();
            _SafeStr_4002 = _arg_1;
        }

        private function onTick(_arg_1:TimerEvent):void
        {
            if (((_SafeStr_4002) && (_SafeStr_4002 > 0)))
            {
                _SafeStr_4002--;
                HabboGamesCom.log(("On results window tick " + _SafeStr_4002));
                updateDialog();
            };
        }

        private function startResultsCountDown(_arg_1:int):void
        {
            startCountDownTimer(_arg_1);
            updateDialog();
        }

        private function stopResultsCountDown():void
        {
            disposeCountDownTimer();
            updateDialog();
        }

        public function startLobbyCountDown(_arg_1:int):void
        {
            _SafeStr_3734 = 3;
            startCountDownTimer(_arg_1);
            updateDialog();
        }

        public function stopLobbyCountDown():void
        {
            disposeCountDownTimer();
            updateDialog();
        }

        public function changeToLobbyState(_arg_1:GameLobbyData):void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            _SafeStr_3734 = 3;
            _lobbyPlayers = new _SafeStr_24();
            var _local_3:Array = [];
            for each (var _local_6:Game2TeamPlayerData in _players)
            {
                _local_4 = (_window.findChildByName((("team" + _local_6.teamId) + "PlayersList")) as IItemListWindow);
                _local_2 = (_window.findChildByName(("player" + _local_6.userId)) as IItemListWindow);
                if (_local_2 == null)
                {
                    return;
                };
                _local_4.removeListItem(_local_2);
                _local_3.push(_local_6.userId);
            };
            for each (var _local_5:int in _local_3)
            {
                delete _players[_local_5];
            };
            _window.findChildByName("loadingContainer").visible = true;
            WindowUtils.hideElement((_window.findChildByName("loadingContainer") as _SafeStr_3133), "loadingText");
            WindowUtils.setCaption(_window.findChildByName("arenaName"), _SafeStr_5466.getArenaName(_arg_1));
            WindowUtils.colorStrokes(getElement(_window, "headerContainer"), getTeamColor(1));
            WindowUtils.setElementImage(_window.findChildByName("arenaPreview"), getBitmap((("arena_" + _arg_1.fieldType) + "_preview")));
        }

        public function playerJoined(_arg_1:GameLobbyPlayerData):void
        {
            if (_arg_1)
            {
                _lobbyPlayers.add(_arg_1.userId, _arg_1);
                renderLobbyPlayers();
            };
        }

        public function playerLeft(_arg_1:int):void
        {
            var _local_2:GameLobbyPlayerData = _lobbyPlayers[_arg_1];
            if (_local_2 != null)
            {
                _lobbyPlayers.remove(_arg_1);
            };
            renderLobbyPlayers();
        }

        private function renderLobbyPlayers():void
        {
            clearPlayers();
            var _local_1:Array = _lobbyPlayers.getValues();
            if (((!(_SafeStr_3734 == 0)) && (!(_SafeStr_3734 == 1))))
            {
                _local_1.sort(GameLobbyPlayerData._SafeStr_3617);
            };
            for each (var _local_2:GameLobbyPlayerData in _local_1)
            {
                addLobbyPlayer(_local_2);
            };
        }

        private function clearPlayers():void
        {
            var _local_2:* = null;
            var _local_1:int = 1;
            while ((_local_2 = (_window.findChildByName((("team" + _local_1++) + "PlayersList")) as IItemListWindow)) != null)
            {
                _local_2.destroyListItems();
            };
        }

        private function addLobbyPlayer(_arg_1:GameLobbyPlayerData):void
        {
            HabboGamesCom.log(("Add Lobby Player: " + [_arg_1.name, _arg_1.userId, _arg_1.teamId]));
            var _local_4:int = ((_lobbyPlayers.getKeys().indexOf(_arg_1.userId) % 2) + 1);
            var _local_7:IItemListWindow = (_window.findChildByName((("team" + _local_4) + "PlayersList")) as IItemListWindow);
            if (_local_7 == null)
            {
                return;
            };
            var _local_6:IItemListWindow = (WindowUtils.createWindow(("snowwar_lobby_player_team_" + _local_4)) as IItemListWindow);
            if (_local_6 == null)
            {
                return;
            };
            var _local_8:_SafeStr_3133 = (_local_6.getListItemByName("playerImageContainer") as _SafeStr_3133);
            var _local_5:_SafeStr_3133 = (_local_6.getListItemByName("playerDataContainer") as _SafeStr_3133);
            var _local_2:_SafeStr_3133 = (_local_6.getListItemByName("playerScoreContainer") as _SafeStr_3133);
            WindowUtils.setElementImage(getElement(_local_8, "playerImage"), getAvatarFigure(_local_4, _arg_1.figure, _arg_1.gender));
            WindowUtils.setCaption(getElement(_local_5, "playerName"), _arg_1.name);
            WindowUtils.hideElement(_local_5, "playerStats");
            WindowUtils.hideElement(_local_2, "playerScore");
            WindowUtils.hideElement(_local_5, "playerTotalStats");
            var _local_9:_SafeStr_3264 = (_local_5.findChildByName("skillLevel") as _SafeStr_3264);
            if (_local_9.bitmap)
            {
                _local_9.bitmap.dispose();
            };
            _local_9.bitmap = getSkillLevelImage(_arg_1.skillLevel, _local_4);
            var _local_3:IRegionWindow = (_local_5.findChildByName("scoreTooltip") as IRegionWindow);
            _local_3.toolTipCaption = ((_arg_1.totalScore.toString() + "/") + _arg_1.scoreToNextLevel.toString());
            _local_3.visible = true;
            _local_7.addListItem(_local_6);
        }

        private function getSkillLevelImage(_arg_1:int, _arg_2:int):BitmapData
        {
            var _local_6:* = null;
            var _local_8:int;
            var _local_7:* = null;
            _arg_1 = Math.min(_arg_1, 30);
            var _local_3:BitmapData = (_SafeStr_5466.assets.getAssetByName("star_empty").content as BitmapData);
            var _local_11:BitmapData = (_SafeStr_5466.assets.getAssetByName("star_filled_bronze").content as BitmapData);
            var _local_9:BitmapData = (_SafeStr_5466.assets.getAssetByName("star_filled_silver").content as BitmapData);
            var _local_10:BitmapData = (_SafeStr_5466.assets.getAssetByName("star_filled_gold").content as BitmapData);
            var _local_5:int = ((_arg_1 > 0) ? (((_arg_1 - 1) % 10) + 1) : 0);
            var _local_4:BitmapData = new BitmapData(150, 13, true, 0);
            _local_8 = 0;
            while (_local_8 < 10)
            {
                _local_7 = ((_arg_2 == 1) ? new Point((_local_8 * 15), 0) : new Point(((9 - _local_8) * 15), 0));
                _local_6 = ((_arg_1 > 20) ? ((_local_5-- > 0) ? _local_10 : _local_3) : ((_arg_1 > 10) ? ((_local_5-- > 0) ? _local_9 : _local_3) : ((_local_5-- > 0) ? _local_11 : _local_3)));
                _local_4.copyPixels(_local_6, _local_6.rect, _local_7);
                _local_8++;
            };
            return (_local_4);
        }

        public function updateGamesLeft():void
        {
            var _local_4:* = null;
            var _local_1:* = null;
            var _local_3:_SafeStr_3133 = (_window.findChildByName("buttonsContainer") as _SafeStr_3133);
            var _local_2:_SafeStr_3133 = (_window.findChildByName("statusContainer") as _SafeStr_3133);
            if (((_local_2) && (_local_3)))
            {
                _local_3.visible = true;
                WindowUtils.setCaption(_local_2.findChildByName("games_left"), _SafeStr_5466.freeGamesLeft.toString());
                _local_4 = (_local_2.findChildByName("games_left_stroke") as ITextWindow);
                _local_1 = _window.findChildByName("button_rematch");
                updateGettingMoreGamesOption();
                if (_SafeStr_5466.hasUnlimitedGames)
                {
                    _local_1.enable();
                    _local_1.color = 0x55CC00;
                    _local_2.visible = false;
                    return;
                };
                switch (_SafeStr_5466.freeGamesLeft)
                {
                    case -1:
                        _local_1.enable();
                        _local_1.color = 0x55CC00;
                        _local_2.visible = false;
                        return;
                    case 0:
                        _local_4.textColor = 0xFF0000;
                        _local_1.enable();
                        _local_1.color = 0x55CC00;
                        return;
                    default:
                        _local_4.textColor = 1079212;
                        _local_1.enable();
                        _local_1.color = 0x55CC00;
                };
            };
        }

        private function onGetMore(_arg_1:WindowMouseEvent):void
        {
            switch (_SafeStr_6234)
            {
                case 1:
                    _SafeStr_5466.openGetMoreGames("gameFramework.buyTokens.clicked.rematchView");
                    return;
                default:
                    onClose(true);
                    _SafeStr_5466.openClubCenter("gameFramework.getVip.clicked.rematchView");
            };
        }

        private function hideChatInput():void
        {
            _SafeStr_5466.roomUI.hideWidget("RWE_CHAT_INPUT_WIDGET");
        }


    }
}//package com.sulake.habbo.game.snowwar.ui

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3164 = "_-rH" (String#2534, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3617 = "_-H1j" (String#30524, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_4002 = "_-iP" (String#1397, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_525 = "_-c1I" (String#3620, DoABC#4)
// _SafeStr_5466 = "_-Z2" (String#393, DoABC#4)
// _SafeStr_5519 = "_-t1T" (String#3915, DoABC#4)
// _SafeStr_611 = "_-C11" (String#17976, DoABC#4)
// _SafeStr_6231 = "_-2b" (String#4720, DoABC#4)
// _SafeStr_6232 = "_-AM" (String#9306, DoABC#4)
// _SafeStr_6233 = "_-51V" (String#5804, DoABC#4)
// _SafeStr_6234 = "_-t0" (String#23462, DoABC#4)
// _SafeStr_8600 = "_-71T" (String#33910, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


