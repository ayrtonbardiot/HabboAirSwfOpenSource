// by nota

//com.sulake.habbo.game.snowwar.ui.GameLobbyWindowCtrl

package com.sulake.habbo.game.snowwar.ui
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.game.snowwar.utils.WindowUtils;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import _-81Y._SafeStr_611;
    import com.sulake.habbo.game.snowwar.utils.SnowWarAnimatedWindowElement;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class GameLobbyWindowCtrl implements _SafeStr_13, _SafeStr_1875 
    {

        private var _SafeStr_3761:GamesMainViewController;
        private var _SafeStr_5466:SnowWarEngine;
        private var _levelName:String;
        private var _numberOfTeams:int;
        private var _numberOfPlayers:int;
        private var _maxNumberOfPlayers:int;
        private var _SafeStr_4003:_SafeStr_3133;
        private var _SafeStr_5519:Timer;
        private var _SafeStr_4002:int = -1;
        private var _queuePosition:int = -1;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_5518:_SafeStr_24;
        private var _SafeStr_5517:_SafeStr_24;

        public function GameLobbyWindowCtrl(_arg_1:GamesMainViewController, _arg_2:String, _arg_3:int, _arg_4:int)
        {
            _SafeStr_3761 = _arg_1;
            _SafeStr_5466 = _arg_1.gameEngine;
            _SafeStr_5518 = new _SafeStr_24();
            _SafeStr_5517 = new _SafeStr_24();
            _levelName = _arg_2;
            _numberOfTeams = _arg_3;
            _numberOfPlayers = numberOfPlayers;
            _maxNumberOfPlayers = _arg_4;
        }

        private function createLobbyView():void
        {
            var _local_1:* = null;
            var _local_3:int;
            _SafeStr_4003 = (_SafeStr_3761.rootWindow.findChildByName("snowwar_lobby_cont") as _SafeStr_3133);
            _SafeStr_4003.center();
            _SafeStr_4003.findChildByName("cancel_link_region").procedure = onCancel;
            var _local_2:IItemGridWindow = (_SafeStr_4003.findChildByName("players_grid") as IItemGridWindow);
            var _local_4:_SafeStr_3133 = (WindowUtils.createWindow("snowwar_lobby_player") as _SafeStr_3133);
            _local_3 = 0;
            while (_local_3 < _maxNumberOfPlayers)
            {
                _local_2.addGridItem(_local_4.clone());
                _local_3++;
            };
            _local_4.dispose();
            _SafeStr_4003.visible = false;
        }

        private function createWindow(_arg_1:String):_SafeStr_3133
        {
            var _local_2:XmlAsset = (_SafeStr_5466.assets.getAssetByName(_arg_1) as XmlAsset);
            return (_SafeStr_5466.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
        }

        private function onCancel(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            onClose(true);
            if (!_SafeStr_5466.gameCenterEnabled)
            {
                _SafeStr_3761.openMainWindow(true);
            }
            else
            {
                _SafeStr_3761.close(true);
            };
        }

        public function onClose(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                _SafeStr_5466.communication.connection.send(new _SafeStr_611());
            };
            disposeCountdownTimer();
            _queuePosition = -1;
        }

        public function set visible(_arg_1:Boolean):void
        {
            if (!_SafeStr_4003)
            {
                createLobbyView();
            };
            _SafeStr_4003.visible = _arg_1;
        }

        public function get visible():Boolean
        {
            if (_SafeStr_4003)
            {
                return (_SafeStr_4003.visible);
            };
            return (false);
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
            if (_SafeStr_5517)
            {
                for each (var _local_1:SnowWarAnimatedWindowElement in _SafeStr_5517)
                {
                    _local_1.dispose();
                };
                _SafeStr_5517.dispose();
                _SafeStr_5517 = null;
            };
            if (_SafeStr_4003 != null)
            {
                _SafeStr_4003.dispose();
                _SafeStr_4003 = null;
            };
            disposeCountdownTimer();
            if (_SafeStr_5518)
            {
                _SafeStr_5518.dispose();
                _SafeStr_5518 = null;
            };
            _queuePosition = -1;
        }

        private function disposeCountdownTimer():void
        {
            if (_SafeStr_5519 != null)
            {
                _SafeStr_5519.removeEventListener("timer", onTick);
                _SafeStr_5519.stop();
                _SafeStr_5519 = null;
            };
            _SafeStr_4002 = -1;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function playerLeft(_arg_1:int):void
        {
            _SafeStr_5518.remove(_arg_1);
            updateDialog(true);
        }

        public function playerJoined(_arg_1:GameLobbyPlayerData):void
        {
            if (_arg_1)
            {
                _SafeStr_5518.add(_arg_1.userId, _arg_1);
                updateDialog(true, _arg_1.figure);
            };
        }

        public function clearPlayerList():void
        {
            _SafeStr_5518.reset();
        }

        public function startCountdown(_arg_1:int):void
        {
            disposeCountdownTimer();
            _SafeStr_4002 = _arg_1;
            _SafeStr_5519 = new Timer(1000, _arg_1);
            _SafeStr_5519.addEventListener("timer", onTick);
            _SafeStr_5519.start();
            updateDialog(false);
        }

        private function onTick(_arg_1:TimerEvent):void
        {
            if (_SafeStr_4036)
            {
                return;
            };
            if (((_SafeStr_4002) && (_SafeStr_4002 > 0)))
            {
                _SafeStr_4002--;
                HabboGamesCom.log(("on tick " + _SafeStr_4002));
                updateDialog(false);
            };
        }

        public function stopCountdown():void
        {
            disposeCountdownTimer();
            updateDialog(false);
        }

        public function set queuePosition(_arg_1:int):void
        {
            _queuePosition = _arg_1;
        }

        private function updateDialog(_arg_1:Boolean, _arg_2:String=null):void
        {
            var _local_16:* = null;
            var _local_13:* = null;
            var _local_9:* = null;
            var _local_8:* = null;
            var _local_15:* = null;
            var _local_10:* = null;
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_14:_SafeStr_3109 = (_SafeStr_4003.findChildByName("wait_text") as ITextWindow);
            var _local_5:_SafeStr_3109 = (_SafeStr_4003.findChildByName("wait_text_stroke") as ITextWindow);
            var _local_3:_SafeStr_18 = _SafeStr_5466.localization;
            if (_SafeStr_4002 >= 0)
            {
                _local_16 = "snowwar.lobby_game_start_countdown";
                _local_3.registerParameter(_local_16, "seconds", _SafeStr_4002);
                _local_13 = ((((_local_16 + " ") + "%seconds%") + " ") + _SafeStr_4002);
            }
            else
            {
                if (_queuePosition >= 0)
                {
                    _local_16 = "snowwar.lobby_arena_queue_position";
                    _local_3.registerParameter(_local_16, "position", _queuePosition);
                    _local_13 = ((((_local_16 + " ") + "%position%") + " ") + _queuePosition);
                }
                else
                {
                    _local_16 = "snowwar.lobby_waiting_for_more_players";
                    _local_13 = _local_16;
                };
            };
            var _local_11:String = _local_3.getLocalization(_local_16);
            if (_local_11)
            {
                _local_14.caption = _local_11;
                _local_5.caption = _local_11;
            }
            else
            {
                _local_14.caption = _local_13;
                _local_5.caption = _local_13;
            };
            var _local_7:int;
            var _local_12:IItemGridWindow = (_SafeStr_4003.findChildByName("players_grid") as IItemGridWindow);
            if (_arg_1)
            {
                for each (var _local_17:GameLobbyPlayerData in _SafeStr_5518.getValues())
                {
                    _local_10 = null;
                    if (((_local_17.figure == _arg_2) || (!(_arg_2))))
                    {
                        _local_10 = _SafeStr_5466.avatarManager.createAvatarImage(_local_17.figure, "h", _local_17.gender, this);
                    };
                    if (_local_10)
                    {
                        _local_10.setDirection("head", 2);
                        _local_4 = _local_10.getCroppedImage("head");
                        _local_9 = (_local_12.getGridItemAt(_local_7) as IRegionWindow);
                        if (_local_9)
                        {
                            _local_9.toolTipCaption = _local_17.name;
                            _local_9.mouseThreshold = 0;
                            _local_8 = (_local_9.findChildByName("image") as _SafeStr_3264);
                            _local_15 = _SafeStr_5517.remove(_local_8);
                            if (_local_15)
                            {
                                _local_15.dispose();
                            };
                            if (_local_8.bitmap)
                            {
                                _local_8.bitmap.dispose();
                            };
                            _local_8.bitmap = new BitmapData(_local_8.width, _local_8.height, true, 0);
                            _local_6 = new Point(((_local_8.width - _local_4.width) / 2), ((_local_8.height - _local_4.height) / 2));
                            _local_8.bitmap.copyPixels(_local_4, _local_4.rect, _local_6);
                        };
                        _local_4.dispose();
                        _local_10.dispose();
                    };
                    _local_7++;
                };
                while (_local_7 < maxNumberOfPlayers)
                {
                    _local_9 = (_local_12.getGridItemAt(_local_7) as IRegionWindow);
                    _local_8 = (_local_9.findChildByName("image") as _SafeStr_3264);
                    if (!_SafeStr_5517.hasKey(_local_8))
                    {
                        _local_15 = new SnowWarAnimatedWindowElement(_SafeStr_5466.assets, _local_8, "load_", 8);
                        _SafeStr_5517.add(_local_8, _local_15);
                    };
                    _local_7++;
                };
            };
        }

        public function avatarImageReady(_arg_1:String):void
        {
            updateDialog(true, _arg_1);
        }

        public function get levelName():String
        {
            return (_levelName);
        }

        public function get numberOfTeams():int
        {
            return (_numberOfTeams);
        }

        public function get numberOfPlayers():int
        {
            return (_numberOfPlayers);
        }

        public function get maxNumberOfPlayers():int
        {
            return (_maxNumberOfPlayers);
        }

        public function set levelName(_arg_1:String):void
        {
            _levelName = _arg_1;
        }

        public function set maxNumberOfPlayers(_arg_1:int):void
        {
            _maxNumberOfPlayers = _arg_1;
        }

        public function set numberOfTeams(_arg_1:int):void
        {
            _numberOfTeams = _arg_1;
        }

        public function set numberOfPlayers(_arg_1:int):void
        {
            _numberOfPlayers = _arg_1;
        }

        public function set counter(_arg_1:int):void
        {
            _SafeStr_4002 = _arg_1;
        }


    }
}//package com.sulake.habbo.game.snowwar.ui

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_4002 = "_-iP" (String#1397, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_5466 = "_-Z2" (String#393, DoABC#4)
// _SafeStr_5517 = "_-pT" (String#3384, DoABC#4)
// _SafeStr_5518 = "_-Gy" (String#6683, DoABC#4)
// _SafeStr_5519 = "_-t1T" (String#3915, DoABC#4)
// _SafeStr_611 = "_-C11" (String#17976, DoABC#4)


