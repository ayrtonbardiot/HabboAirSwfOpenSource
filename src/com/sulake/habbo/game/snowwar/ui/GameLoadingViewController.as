// by nota

//com.sulake.habbo.game.snowwar.ui.GameLoadingViewController

package com.sulake.habbo.game.snowwar.ui
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
    import com.sulake.habbo.game.snowwar.utils.SnowWarAnimatedWindowElement;
    import com.sulake.habbo.game.snowwar.utils.WindowUtils;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import _-PD.Game2ExitGameMessageComposer;
    import _-M1k._SafeStr_525;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.IAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.geom.Point;
    import com.sulake.habbo.avatar._SafeStr_3164;
    import com.sulake.habbo.avatar._SafeStr_3138;

    public class GameLoadingViewController implements _SafeStr_13, _SafeStr_1875 
    {

        private var _disposed:Boolean;
        private var _SafeStr_5466:SnowWarEngine;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5517:_SafeStr_24;
        private var _SafeStr_6434:GameLobbyData;
        private var _SafeStr_6231:BackgroundViewController;
        private var _SafeStr_6435:Array = [];

        public function GameLoadingViewController(_arg_1:SnowWarEngine)
        {
            _SafeStr_5466 = _arg_1;
            _SafeStr_5517 = new _SafeStr_24();
            createMainWindow();
            _SafeStr_6231 = new BackgroundViewController(_SafeStr_5466);
            _SafeStr_6231.background.visible = true;
            _SafeStr_5466.windowManager.getDesktop(1).visible = false;
            _SafeStr_5466.roomUI.visible = false;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _SafeStr_5466.windowManager.getDesktop(1).visible = true;
            _SafeStr_5466 = null;
            if (_SafeStr_5517)
            {
                for each (var _local_1:SnowWarAnimatedWindowElement in _SafeStr_5517)
                {
                    _local_1.dispose();
                };
                _SafeStr_5517.dispose();
                _SafeStr_5517 = null;
            };
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_6231)
            {
                _SafeStr_6231.dispose();
                _SafeStr_6231 = null;
            };
            _disposed = true;
            _SafeStr_6435 = [];
        }

        private function createMainWindow():void
        {
            _window = (WindowUtils.createWindow("snowwar_ending") as _SafeStr_3133);
            _window.x = ((_window.desktop.width - _window.width) / 2);
            _window.y = ((_window.desktop.height > 685) ? 115 : 10);
            WindowUtils.setCaption(_window.findChildByName("endingInformation"), "${snowwar.loading.title}");
            WindowUtils.hideElement(_window, "buttonsContainer");
            WindowUtils.hideElement(_window, "mostKillsContainer");
            WindowUtils.hideElement(_window, "mostHitsContainer");
            WindowUtils.hideElement(_window, "team1Score");
            WindowUtils.hideElement(_window, "team2Score");
            WindowUtils.hideElement(_window, "statusContainer");
            _window.findChildByName("loadingContainer").visible = true;
            _window.findChildByName("leave_link_region").procedure = onCancel;
        }

        private function onCancel(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            onClose();
        }

        private function onClose():void
        {
            if (_SafeStr_5466 != null)
            {
                _SafeStr_5466.gameCancelled(true);
                _SafeStr_5466.send(new Game2ExitGameMessageComposer());
                if (_SafeStr_5466.roomBeforeGame > -1)
                {
                    _SafeStr_5466.send(new _SafeStr_525(_SafeStr_5466.roomBeforeGame, false, true));
                };
                _SafeStr_5466.disposeLoadingView();
            };
        }

        public function show(_arg_1:GameLobbyData):void
        {
            _SafeStr_6434 = _arg_1;
            var _local_2:_SafeStr_3264 = (_window.findChildByName("arenaPreview") as _SafeStr_3264);
            var _local_3:IAsset = _SafeStr_5466.assets.getAssetByName((("arena_" + _arg_1.fieldType) + "_preview"));
            if (_local_3)
            {
                _local_2.bitmap = (_local_3.content as BitmapData);
                _local_2.disposesBitmap = false;
            };
            WindowUtils.setCaption(_window.findChildByName("arenaName"), _SafeStr_5466.getArenaName(_arg_1));
            renderPlayers();
        }

        private function renderPlayers():void
        {
            clearPlayers();
            for each (var _local_1:GameLobbyPlayerData in _SafeStr_6434.players.sort(GameLobbyPlayerData._SafeStr_3617))
            {
                addPlayer(_local_1);
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

        private function addPlayer(_arg_1:GameLobbyPlayerData):void
        {
            var _local_12:int;
            var _local_5:int = _arg_1.teamId;
            var _local_8:IItemListWindow = (_window.findChildByName((("team" + _local_5) + "PlayersList")) as IItemListWindow);
            var _local_7:IItemListWindow = (WindowUtils.createWindow(("snowwar_results_player_team_" + _local_5)) as IItemListWindow);
            var _local_9:_SafeStr_3133 = (_local_7.getListItemByName("playerImageContainer") as _SafeStr_3133);
            var _local_6:_SafeStr_3133 = (_local_7.getListItemByName("playerDataContainer") as _SafeStr_3133);
            var _local_2:_SafeStr_3133 = (_local_7.getListItemByName("playerScoreContainer") as _SafeStr_3133);
            if (_arg_1.userId == _SafeStr_5466.sessionDataManager.userId)
            {
                WindowUtils.setElementImage(_local_9.findChildByName("playerImageBackground"), getBitmap("green_square"));
            };
            switch (_local_5)
            {
                case 2:
                    _local_12 = 4;
                    break;
                default:
                    _local_12 = 2;
            };
            WindowUtils.setElementImage(getElement(_local_9, "playerImage"), getAvatarFigure(_arg_1.teamId, _arg_1.figure, _arg_1.gender, _local_12));
            WindowUtils.setCaption(getElement(_local_6, "playerName"), _arg_1.name);
            WindowUtils.hideElement(_local_6, "playerStats");
            WindowUtils.hideElement(_local_2, "playerScore");
            WindowUtils.hideElement(_local_6, "playerTotalStats");
            var _local_10:_SafeStr_3264 = (_local_6.findChildByName("skillLevel") as _SafeStr_3264);
            if (_local_10.bitmap)
            {
                _local_10.bitmap.dispose();
            };
            _local_10.bitmap = getSkillLevelImage(_arg_1.skillLevel, _arg_1.teamId);
            var _local_3:IRegionWindow = (_local_6.findChildByName("scoreTooltip") as IRegionWindow);
            _local_3.toolTipCaption = ((_arg_1.totalScore.toString() + "/") + _arg_1.scoreToNextLevel.toString());
            _local_3.visible = true;
            _local_8.addListItem(_local_7);
            var _local_4:_SafeStr_3264 = (_local_2.findChildByName("loadingIcon") as _SafeStr_3264);
            var _local_11:SnowWarAnimatedWindowElement = _SafeStr_5517.remove(_arg_1.userId);
            if (_local_11)
            {
                _local_11.dispose();
            };
            _local_11 = new SnowWarAnimatedWindowElement(_SafeStr_5466.assets, _local_4, "load_", 8);
            _SafeStr_5517.add(_arg_1.userId, _local_11);
            _local_4.visible = true;
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

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function avatarImageReady(_arg_1:String):void
        {
            if (_SafeStr_6435.indexOf(_arg_1) == -1)
            {
                renderPlayers();
                _SafeStr_6435.push(_arg_1);
            };
        }

        private function getElement(_arg_1:_SafeStr_3133, _arg_2:String):_SafeStr_3109
        {
            return (_arg_1.findChildByName(_arg_2));
        }

        private function getBitmap(_arg_1:String):BitmapData
        {
            return (_SafeStr_5466.assets.getAssetByName(_arg_1).content as BitmapData);
        }

        private function getAvatarFigure(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:int):BitmapData
        {
            var _local_5:_SafeStr_3164 = _SafeStr_5466.avatarManager.createFigureContainer(_arg_2);
            switch (_arg_1)
            {
                case 1:
                    _local_5.updatePart("ch", 20000, [1]);
                    break;
                case 2:
                    _local_5.updatePart("ch", 20001, [1]);
                    break;
                default:
                    _local_5.updatePart("ch", 20000, [1]);
            };
            _local_5.removePart("cc");
            var _local_6:_SafeStr_3138 = _SafeStr_5466.avatarManager.createAvatarImage(_local_5.getFigureString(), "h_50", _arg_3, this);
            if (_local_6)
            {
                _local_6.setDirection("full", _arg_4);
                return (_local_6.getCroppedImage("full"));
            };
            return (null);
        }

        public function showReadyPlayers(_arg_1:Array):void
        {
            var _local_3:* = null;
            for each (var _local_2:int in _arg_1)
            {
                _local_3 = _SafeStr_5517.remove(_local_2);
                if (_local_3)
                {
                    _local_3.dispose();
                };
            };
            if (_SafeStr_5517.length == 0)
            {
                _SafeStr_5517.add(-1, new SnowWarAnimatedWindowElement(_SafeStr_5466.assets, (_window.findChildByName("mainLoadingIcon") as _SafeStr_3264), "load_", 8));
                WindowUtils.setCaption(_window.findChildByName("loadingText"), "${snowwar.loading_arena}");
            };
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
// _SafeStr_525 = "_-c1I" (String#3620, DoABC#4)
// _SafeStr_5466 = "_-Z2" (String#393, DoABC#4)
// _SafeStr_5517 = "_-pT" (String#3384, DoABC#4)
// _SafeStr_6231 = "_-2b" (String#4720, DoABC#4)
// _SafeStr_6434 = "_-uR" (String#17959, DoABC#4)
// _SafeStr_6435 = "_-lK" (String#10615, DoABC#4)


