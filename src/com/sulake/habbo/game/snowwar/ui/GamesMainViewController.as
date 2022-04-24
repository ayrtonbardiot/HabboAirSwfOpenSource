// by nota

//com.sulake.habbo.game.snowwar.ui.GamesMainViewController

package com.sulake.habbo.game.snowwar.ui
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.game.snowwar.utils.SnowWarAnimatedWindowElement;
    import flash.utils.Timer;
    import com.sulake.habbo.game.snowwar.utils.WindowUtils;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.ITextWindow;
    import flash.events.TimerEvent;

    public class GamesMainViewController implements _SafeStr_13 
    {

        private static const INSTRUCTION_ASSETS:Array = ["move_", "throw_1_", "throw_2_", "throw_3_", "balls_"];
        private static const INSTRUCTION_FRAME_COUNTS:Array = [4, 4, 5, 5, 5];
        private static const INSTRUCTION_FRAME_LENGTH:int = 1000;

        private var _SafeStr_5466:SnowWarEngine;
        private var _SafeStr_5252:_SafeStr_3133;
        private var _SafeStr_4079:_SafeStr_3133;
        private var _SafeStr_5467:GameLobbyWindowCtrl;
        private var _SafeStr_4036:Boolean;
        private var _instructionsAnimation:SnowWarAnimatedWindowElement;
        private var _SafeStr_5468:Timer;
        private var _SafeStr_5469:int = 0;
        private var _currentInstruction:int = 0;

        public function GamesMainViewController(_arg_1:SnowWarEngine)
        {
            _SafeStr_5466 = _arg_1;
        }

        public function get gameEngine():SnowWarEngine
        {
            return (_SafeStr_5466);
        }

        public function get rootWindow():_SafeStr_3133
        {
            return (_SafeStr_5252);
        }

        public function get lobbyView():GameLobbyWindowCtrl
        {
            return (_SafeStr_5467);
        }

        public function toggleVisibility():void
        {
            if (_SafeStr_5252)
            {
                _SafeStr_5252.visible = (!(rootWindow.visible));
            }
            else
            {
                openMainWindow(true);
            };
        }

        private function createWindow():void
        {
            var _local_1:int;
            _SafeStr_5252 = (WindowUtils.createWindow("games_main", 1) as _SafeStr_3133);
            _SafeStr_5252.findChildByTag("close").addEventListener("WME_CLICK", onClose);
            _SafeStr_5252.visible = true;
            _SafeStr_5252.center();
            _SafeStr_4079 = (_SafeStr_5252.findChildByName("quick_play_container") as _SafeStr_3133);
            _SafeStr_4079.findChildByName("play.button").addEventListener("WME_CLICK", onPlay);
            _SafeStr_4079.visible = false;
            _SafeStr_4079.findChildByName("instructions_link").addEventListener("WME_CLICK", onInstructions);
            _SafeStr_4079.findChildByName("leaderboard_link").addEventListener("WME_CLICK", onLeaderboard);
            _SafeStr_4079.findChildByName("instructions_back").addEventListener("WME_CLICK", onBack);
            _SafeStr_4079.findChildByName("instructions_next").addEventListener("WME_CLICK", onNext);
            _SafeStr_4079.findChildByName("instructions_prev").addEventListener("WME_CLICK", onPrevious);
            _SafeStr_4079.findChildByName("games_vip_region").addEventListener("WME_CLICK", onOpenClubCenter);
            _SafeStr_4079.procedure = windowEventProc;
            _SafeStr_4079.findChildByName("leaderboard_link").visible = _SafeStr_5466.config.getBoolean("games.highscores.enabled");
            var _local_2:IItemListWindow = (_SafeStr_4079.findChildByName("page_list") as IItemListWindow);
            _local_1 = 0;
            while (_local_1 < _local_2.numListItems)
            {
                _local_2.getListItemAt(_local_1).addEventListener("WME_CLICK", onSelectPage);
                _local_1++;
            };
            _SafeStr_4036 = false;
            updateGameStartingStatus();
        }

        private function windowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((_arg_1.type == "WME_OVER") || (_arg_1.type == "WME_OUT")))
            {
                switch (_arg_2.name)
                {
                    case "btn_more_games_10":
                        WindowUtils.setElementImage(_arg_2, getBitmap(("btn_more_games_10" + ((_arg_1.type == "WME_OVER") ? "_hi" : ""))));
                        break;
                    case "btn_more_games_100":
                        WindowUtils.setElementImage(_arg_2, getBitmap(("btn_more_games_100" + ((_arg_1.type == "WME_OVER") ? "_hi" : ""))));
                        break;
                    case "btn_more_games_300":
                        WindowUtils.setElementImage(_arg_2, getBitmap(("btn_more_games_300" + ((_arg_1.type == "WME_OVER") ? "_hi" : ""))));
                };
            };
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "btn_more_games_10":
                        _SafeStr_5466.catalog.buySnowWarTokensOffer("GET_SNOWWAR_TOKENS");
                        _SafeStr_5466.logGameEvent("gameFramework.buyTokens.clicked.frontView");
                        return;
                    case "btn_more_games_100":
                        _SafeStr_5466.catalog.buySnowWarTokensOffer("GET_SNOWWAR_TOKENS2");
                        _SafeStr_5466.logGameEvent("gameFramework.buyTokens.clicked.frontView");
                        return;
                    case "btn_more_games_300":
                        _SafeStr_5466.catalog.buySnowWarTokensOffer("GET_SNOWWAR_TOKENS3");
                        _SafeStr_5466.logGameEvent("gameFramework.buyTokens.clicked.frontView");
                        return;
                };
            };
        }

        public function close(_arg_1:Boolean):void
        {
            if (((_SafeStr_5467) && (_SafeStr_5467.visible)))
            {
                _SafeStr_5467.onClose(_arg_1);
            };
            disposeViews();
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            close(true);
        }

        private function onPlay(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_5466.freeGamesLeft != 0)
            {
                _SafeStr_5466.startQuickServerGame();
            }
            else
            {
                _SafeStr_5466.openGetMoreGames("gameFramework.onPlay.clicked.frontView");
            };
        }

        private function updateGettingMoreGamesOption():void
        {
            var _local_1:_SafeStr_3109 = _SafeStr_4079.findChildByName("play.button");
            if (_SafeStr_5466.freeGamesLeft == 0)
            {
                _local_1.visible = false;
            }
            else
            {
                _local_1.visible = true;
            };
        }

        private function onInstructions(_arg_1:WindowMouseEvent):void
        {
            showInstructions(true);
        }

        private function onLeaderboard(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_5466.showLeaderboard();
        }

        private function onBack(_arg_1:WindowMouseEvent):void
        {
            showInstructions(false);
        }

        private function onNext(_arg_1:WindowMouseEvent):void
        {
            _currentInstruction++;
            _currentInstruction = (_currentInstruction % INSTRUCTION_ASSETS.length);
            showInstructions(true);
        }

        private function onPrevious(_arg_1:WindowMouseEvent):void
        {
            _currentInstruction = ((_currentInstruction - 1) + INSTRUCTION_ASSETS.length);
            _currentInstruction = (_currentInstruction % INSTRUCTION_ASSETS.length);
            showInstructions(true);
        }

        private function onSelectPage(_arg_1:WindowMouseEvent):void
        {
            _currentInstruction = parseInt(_arg_1.window.name.replace("page_", ""));
            showInstructions(true);
        }

        private function showInstructions(_arg_1:Boolean):void
        {
            var _local_3:int;
            var _local_7:* = null;
            _SafeStr_4079.findChildByName("teaser_container").visible = (!(_arg_1));
            _SafeStr_4079.findChildByName("instructions_container").visible = _arg_1;
            if (_instructionsAnimation)
            {
                _instructionsAnimation.dispose();
                _instructionsAnimation = null;
            };
            if (!_arg_1)
            {
                return;
            };
            var _local_4:_SafeStr_3264 = (_SafeStr_4079.findChildByName("instructions_image") as _SafeStr_3264);
            var _local_6:String = INSTRUCTION_ASSETS[_currentInstruction];
            var _local_2:int = INSTRUCTION_FRAME_COUNTS[_currentInstruction];
            _instructionsAnimation = new SnowWarAnimatedWindowElement(_SafeStr_5466.assets, _local_4, _local_6, _local_2, 1000);
            _SafeStr_4079.findChildByName("instruction_text").caption = (("${snowwar.instructions." + (_currentInstruction + 1)) + "}");
            var _local_5:IItemListWindow = (_SafeStr_4079.findChildByName("page_list") as IItemListWindow);
            _local_3 = 0;
            while (_local_3 < _local_5.numListItems)
            {
                _local_7 = (_local_5.getListItemAt(_local_3) as _SafeStr_3133);
                _local_6 = ((_local_3 <= _currentInstruction) ? "pagination_ball_hilite" : "pagination_ball");
                WindowUtils.setElementImage(_local_7.getChildAt(0), getBitmap(_local_6));
                _local_3++;
            };
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

        private function onOpenClubCenter(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_5466.openClubCenter("gameFramework.getVip.clicked.frontView");
        }

        public function openMainWindow(_arg_1:Boolean):void
        {
            if (((!(_SafeStr_5252)) && (_arg_1)))
            {
                createWindow();
            }
            else
            {
                if (((!(rootWindow)) && (!(_arg_1))))
                {
                    return;
                };
            };
            if (_SafeStr_5467)
            {
                _SafeStr_5467.visible = false;
            };
            _SafeStr_4079.visible = true;
        }

        public function openGameLobbyWindow(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
            if (!_SafeStr_5252)
            {
                createWindow();
            };
            if (!_SafeStr_5467)
            {
                _SafeStr_5467 = new GameLobbyWindowCtrl(this, _arg_1, _arg_2, _arg_3);
            }
            else
            {
                _SafeStr_5467.levelName = _arg_1;
                _SafeStr_5467.numberOfTeams = _arg_2;
                _SafeStr_5467.maxNumberOfPlayers = _arg_3;
                _SafeStr_5467.clearPlayerList();
            };
            _SafeStr_4079.visible = false;
            _SafeStr_5467.visible = true;
        }

        public function dispose():void
        {
            if (!_SafeStr_4036)
            {
                disposeViews();
                _SafeStr_4036 = true;
                disposeCounter();
            };
        }

        private function disposeViews():void
        {
            if (_instructionsAnimation)
            {
                _instructionsAnimation.dispose();
                _instructionsAnimation = null;
            };
            if (_SafeStr_5467)
            {
                _SafeStr_5467.dispose();
                _SafeStr_5467 = null;
            };
            if (_SafeStr_4079)
            {
                _SafeStr_4079.dispose();
                _SafeStr_4079 = null;
            };
            if (_SafeStr_5252)
            {
                _SafeStr_5252.dispose();
                _SafeStr_5252 = null;
            };
        }

        private function disposeCounter():void
        {
            if (_SafeStr_5468)
            {
                _SafeStr_5468.removeEventListener("timer", onTick);
                _SafeStr_5468.stop();
                _SafeStr_5468 = null;
            };
            _SafeStr_5469 = NaN;
        }

        public function get gameLobbyWindowActive():Boolean
        {
            return ((_SafeStr_5467) && (_SafeStr_5467.visible));
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function updateGameStartingStatus():void
        {
            var _local_1:* = null;
            var _local_3:* = null;
            var _local_2:* = null;
            if (((_SafeStr_4079) && (_SafeStr_4079.visible)))
            {
                WindowUtils.setCaption(_SafeStr_4079.findChildByName("games_left"), _SafeStr_5466.freeGamesLeft.toString());
                _local_1 = (_SafeStr_4079.findChildByName("games_left_region") as _SafeStr_3133);
                _local_3 = (_SafeStr_4079.findChildByName("games_left_stroke") as ITextWindow);
                _local_2 = _SafeStr_4079.findChildByName("play.button");
                _local_2.visible = true;
                updateGettingMoreGamesOption();
                if (checkGameAmountStatus(_local_1, _local_3, _local_2))
                {
                    checkBlockStatus(_local_2);
                };
            };
        }

        private function checkGameAmountStatus(_arg_1:_SafeStr_3133, _arg_2:ITextWindow, _arg_3:_SafeStr_3109):Boolean
        {
            if (_SafeStr_5466.hasUnlimitedGames)
            {
                _arg_1.visible = false;
                return (true);
            };
            _arg_1.visible = true;
            var _local_4:_SafeStr_3109 = ITextWindow(_SafeStr_4079.findChildByName("play_text"));
            _arg_3.color = 0x55CC00;
            switch (_SafeStr_5466.freeGamesLeft)
            {
                case -1:
                    _arg_1.visible = false;
                    WindowUtils.setCaption(_local_4, "${snowwar.play}");
                    return (true);
                case 0:
                    _arg_1.visible = true;
                    _arg_2.textColor = 0xFF0000;
                    WindowUtils.setCaption(_local_4, "${catalog.vip.buy.title}");
                    return (false);
                default:
                    _arg_1.visible = true;
                    _arg_2.textColor = 1079212;
                    WindowUtils.setCaption(_local_4, "${snowwar.play}");
                    return (true);
            };
        }

        private function checkBlockStatus(_arg_1:_SafeStr_3109):void
        {
            var _local_3:int;
            var _local_2:int;
            var _local_4:_SafeStr_3109 = ITextWindow(_SafeStr_4079.findChildByName("play_text"));
            if (_SafeStr_5469 > 0)
            {
                _arg_1.disable();
                _arg_1.color = 0xCCCCCC;
                _local_3 = int(Math.floor((_SafeStr_5469 / 60)));
                _local_2 = (_SafeStr_5469 % 60);
                _local_4.caption = ((_local_3 + ":") + ((_local_2 < 10) ? ("0" + _local_2) : _local_2));
            }
            else
            {
                if (_SafeStr_5469 <= 0)
                {
                    _arg_1.enable();
                    _arg_1.color = 0x55CC00;
                    WindowUtils.setCaption(_local_4, "${snowwar.play}");
                };
            };
        }

        private function onTick(_arg_1:TimerEvent):void
        {
            if (((_SafeStr_5469) && (_SafeStr_5469 > 0)))
            {
                _SafeStr_5469--;
                HabboGamesCom.log(("on block tick " + _SafeStr_5469));
                updateGameStartingStatus();
            };
            if (_SafeStr_5469 <= 0)
            {
                updateGameStartingStatus();
                disposeCounter();
            };
        }

        public function changeBlockStatus(_arg_1:int):void
        {
            if (_arg_1 > 0)
            {
                _SafeStr_5469 = _arg_1;
                if (!_SafeStr_5468)
                {
                    _SafeStr_5468 = new Timer(1000, _SafeStr_5469);
                    _SafeStr_5468.addEventListener("timer", onTick);
                    _SafeStr_5468.start();
                };
            };
            updateGameStartingStatus();
        }


    }
}//package com.sulake.habbo.game.snowwar.ui

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4079 = "_-f1q" (String#323, DoABC#4)
// _SafeStr_5252 = "_-s8" (String#3084, DoABC#4)
// _SafeStr_5466 = "_-Z2" (String#393, DoABC#4)
// _SafeStr_5467 = "_-I1e" (String#3666, DoABC#4)
// _SafeStr_5468 = "_-Y1B" (String#6950, DoABC#4)
// _SafeStr_5469 = "_-Td" (String#4567, DoABC#4)


