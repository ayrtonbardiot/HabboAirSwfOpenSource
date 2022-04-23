// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.leaderboard.LeaderboardTable

package com.sulake.habbo.game.snowwar.leaderboard
{
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import _-d1Q._SafeStr_1623;
    import _-H16.Game2GetFriendsLeaderboardComposer;
    import com.sulake.core.communication.messages.IMessageComposer;

    public class LeaderboardTable 
    {

        public static const SCROLL_DOWN:int = 0;
        public static const SCROLL_UP:int = 1;

        protected var _SafeStr_5466:SnowWarEngine;
        protected var _SafeStr_8598:Boolean;
        protected var _SafeStr_4115:int;
        protected var _SafeStr_6620:int = -1;
        protected var _disposed:Boolean;
        protected var _SafeStr_5093:Array;
        protected var _SafeStr_6220:int = -1;
        protected var _SafeStr_6625:int;
        protected var _SafeStr_6621:int = 8;
        protected var _SafeStr_6622:int = 50;
        protected var _SafeStr_6623:Boolean = true;
        protected var _SafeStr_6624:int;

        public function LeaderboardTable(_arg_1:SnowWarEngine)
        {
            _SafeStr_5466 = _arg_1;
            _SafeStr_4115 = _SafeStr_5466.sessionDataManager.userId;
            _SafeStr_6621 = _SafeStr_5466.config.getInteger("games.highscores.viewSize", 8);
            _SafeStr_6622 = _SafeStr_5466.config.getInteger("games.highscores.windowSize", 50);
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            disposeTable();
            _SafeStr_5466 = null;
            _SafeStr_5093 = null;
            _disposed = true;
        }

        public function disposeTable():void
        {
            _SafeStr_6220 = -1;
            _SafeStr_5093 = null;
            _SafeStr_6625 = -1;
            _SafeStr_6623 = true;
        }

        public function addEntries(_arg_1:Array, _arg_2:int):void
        {
            _SafeStr_6625 = _arg_2;
            if (!_SafeStr_5093)
            {
                _SafeStr_5093 = _arg_1;
                initializeList();
            }
            else
            {
                _SafeStr_5093 = _arg_1;
                updateCurrentIndex();
            };
            _SafeStr_6623 = false;
        }

        public function addGroupEntries(_arg_1:Array, _arg_2:int, _arg_3:int):void
        {
            _SafeStr_6620 = _arg_3;
            _SafeStr_6625 = _arg_2;
            if (!_SafeStr_5093)
            {
                _SafeStr_5093 = _arg_1;
                initializeList();
            }
            else
            {
                _SafeStr_5093 = _arg_1;
                updateCurrentIndex();
            };
            _SafeStr_6623 = false;
        }

        protected function initializeList():void
        {
            var _local_3:int;
            var _local_1:Boolean;
            var _local_2:int;
            _local_3 = 0;
            while (_local_3 < _SafeStr_5093.length)
            {
                _local_1 = ((_SafeStr_5093[_local_3] as _SafeStr_1623).gender == "g");
                if (((!(_local_1)) && ((_SafeStr_5093[_local_3] as _SafeStr_1623).userId == _SafeStr_4115)))
                {
                    _local_2 = _local_3;
                    break;
                };
                if (((_local_1) && ((_SafeStr_5093[_local_3] as _SafeStr_1623).userId == _SafeStr_6620)))
                {
                    _local_2 = _local_3;
                    break;
                };
                _local_3++;
            };
            if (_local_2 >= _SafeStr_6621)
            {
                _SafeStr_6220 = (_local_2 - (_SafeStr_6621 / 2));
            }
            else
            {
                _SafeStr_6220 = 0;
            };
        }

        private function updateCurrentIndex():void
        {
            if (_SafeStr_6220 < 0)
            {
                _SafeStr_6220 = (_SafeStr_6220 + _SafeStr_6622);
            }
            else
            {
                _SafeStr_6220 = (_SafeStr_6220 - _SafeStr_6622);
            };
        }

        public function isInitialized():Boolean
        {
            return (!(_SafeStr_5093 == null));
        }

        public function scrollUp():Boolean
        {
            var _local_2:int;
            var _local_1:* = null;
            if (_SafeStr_6623)
            {
                return (false);
            };
            _SafeStr_6220 = (_SafeStr_6220 - _SafeStr_6621);
            if (_SafeStr_6220 < 0)
            {
                if (_SafeStr_5093[0].rank > 1)
                {
                    _local_2 = Math.max(1, (_SafeStr_5093[0].rank - _SafeStr_6622));
                    _local_1 = getMessageComposer(_SafeStr_6624, _local_2, 1);
                    _SafeStr_5466.communication.connection.send(_local_1);
                    _SafeStr_6623 = true;
                    return (false);
                };
                _SafeStr_6220 = 0;
            };
            return (true);
        }

        protected function getMessageComposer(_arg_1:int, _arg_2:int, _arg_3:int):IMessageComposer
        {
            return (new Game2GetFriendsLeaderboardComposer(_arg_1, _arg_2, _arg_3, _SafeStr_6621, _SafeStr_6622));
        }

        public function scrollDown():Boolean
        {
            var _local_2:int;
            var _local_1:* = null;
            if (_SafeStr_6623)
            {
                return (false);
            };
            _SafeStr_6220 = (_SafeStr_6220 + _SafeStr_6621);
            if ((_SafeStr_6220 + _SafeStr_6621) >= _SafeStr_5093.length)
            {
                if (_SafeStr_5093[(_SafeStr_5093.length - 1)].rank < _SafeStr_6625)
                {
                    _local_2 = (_SafeStr_5093[(_SafeStr_5093.length - 1)].rank + 1);
                    _local_1 = getMessageComposer(_SafeStr_6624, _local_2, 0);
                    _SafeStr_5466.communication.connection.send(_local_1);
                    _SafeStr_6623 = true;
                    return (false);
                };
            };
            return (true);
        }

        public function revertToDefaultView(_arg_1:int):void
        {
            disposeTable();
            var _local_2:IMessageComposer = getMessageComposer(_arg_1, -1, 0);
            _SafeStr_5466.communication.connection.send(_local_2);
            _SafeStr_6623 = true;
            _SafeStr_6624 = _arg_1;
        }

        public function getVisibleEntries():Array
        {
            var _local_2:int;
            var _local_1:Array = [];
            if (!_SafeStr_5093)
            {
                return (_local_1);
            };
            var _local_3:int = Math.min(_SafeStr_5093.length, (_SafeStr_6220 + _SafeStr_6621));
            _local_2 = _SafeStr_6220;
            while (_local_2 < _local_3)
            {
                _local_1.push(_SafeStr_5093[_local_2]);
                _local_2++;
            };
            return (_local_1);
        }

        public function canScrollUp():Boolean
        {
            if ((((_SafeStr_6623) || (!(_SafeStr_5093))) || (_SafeStr_5093.length == 0)))
            {
                return (false);
            };
            if (((_SafeStr_5093[0].rank == 1) && (_SafeStr_6220 <= 0)))
            {
                return (false);
            };
            return (true);
        }

        public function canScrollDown():Boolean
        {
            if ((((_SafeStr_6623) || (!(_SafeStr_5093))) || (_SafeStr_5093.length == 0)))
            {
                return (false);
            };
            if (((_SafeStr_5093[(_SafeStr_5093.length - 1)].rank >= _SafeStr_6625) && ((_SafeStr_6220 + _SafeStr_6621) >= _SafeStr_5093.length)))
            {
                return (false);
            };
            return (true);
        }

        public function get viewSize():int
        {
            return (_SafeStr_6621);
        }

        public function get favouriteGroupId():int
        {
            return (_SafeStr_6620);
        }


    }
}//package com.sulake.habbo.game.snowwar.leaderboard

// _SafeStr_1623 = "_-g1X" (String#12244, DoABC#4)
// _SafeStr_4115 = "_-B1l" (String#5568, DoABC#4)
// _SafeStr_5093 = "_-Pc" (String#1317, DoABC#4)
// _SafeStr_5466 = "_-Z2" (String#393, DoABC#4)
// _SafeStr_6220 = "_-R1h" (String#2216, DoABC#4)
// _SafeStr_6620 = "_-u8" (String#14425, DoABC#4)
// _SafeStr_6621 = "_-a1b" (String#3454, DoABC#4)
// _SafeStr_6622 = "_-k1z" (String#6229, DoABC#4)
// _SafeStr_6623 = "_-X1i" (String#4371, DoABC#4)
// _SafeStr_6624 = "_-aH" (String#13995, DoABC#4)
// _SafeStr_6625 = "_-Jp" (String#7932, DoABC#4)
// _SafeStr_8598 = "_-Y1x" (String#35538, DoABC#4)


