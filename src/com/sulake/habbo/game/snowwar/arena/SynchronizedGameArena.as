// by nota

//com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena

package com.sulake.habbo.game.snowwar.arena
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.game.snowwar.SnowWarEngine;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.game.snowwar._SafeStr_3310;

    public class SynchronizedGameArena implements _SafeStr_13 
    {

        private var _SafeStr_5466:SnowWarEngine;
        private var _SafeStr_6162:Array;
        protected var _SafeStr_6163:int;
        private var _SafeStr_6164:int;
        private var _SafeStr_6166:int = 1;
        private var _SafeStr_6167:_SafeStr_3309;
        private var _extension:IGameArenaExtension;
        private var _checkSums:_SafeStr_24;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_6165:Boolean = false;
        private var _numberOfTeams:int;
        private var _SafeStr_6168:Array;


        public function dispose():void
        {
            _SafeStr_4036 = true;
            _SafeStr_5466 = null;
            _SafeStr_6162 = null;
            _SafeStr_6167 = null;
            if (_extension != null)
            {
                _extension.dispose();
                _extension = null;
            };
            _checkSums = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function initialize(_arg_1:SnowWarEngine, _arg_2:int):void
        {
            _SafeStr_5466 = _arg_1;
            _SafeStr_6167 = new _SafeStr_3310();
            _checkSums = new _SafeStr_24();
            _SafeStr_6162 = [];
            _numberOfTeams = _arg_2;
            _SafeStr_6163 = 0;
            _SafeStr_6164 = 0;
            _SafeStr_6162[_SafeStr_6163] = initEmptyEventQueue();
            _checkSums = new _SafeStr_24();
            resetTeamScores();
        }

        public function get gameEngine():SnowWarEngine
        {
            return (_SafeStr_5466);
        }

        public function pulse():void
        {
            gamePulse();
        }

        public function gamePulse():void
        {
            var _local_1:* = null;
            var _local_4:* = null;
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((("Turn " + _SafeStr_6163) + " subturn ") + (_SafeStr_6164 + 1)) + "/") + getNumberOfSubTurns()));
            };
            var _local_3:_SafeStr_3309 = _SafeStr_3309(getCurrentStage());
            var _local_2:Array = _SafeStr_6162[_SafeStr_6163];
            if (_local_2)
            {
                _local_1 = _local_2[_SafeStr_6164];
                while (_local_1.length > 0)
                {
                    _local_4 = (_local_1.shift() as ISynchronizedGameEvent);
                    if (HabboGamesCom.logEnabled)
                    {
                        HabboGamesCom.log(((((((("GameInstance::gameTurn: applying event " + _local_4) + " turn ") + _SafeStr_6163) + " subturn ") + (_SafeStr_6164 + 1)) + "/") + getNumberOfSubTurns()));
                    };
                    _local_4.apply(_local_3);
                };
            };
            if (!_SafeStr_6165)
            {
                _local_3.subturn();
            };
            if (_SafeStr_6164 >= (getNumberOfSubTurns() - 1))
            {
                if ((_SafeStr_6163 % _SafeStr_6166) == 0)
                {
                    _checkSums[_SafeStr_6163] = getCurrentStage().calculateChecksum(_SafeStr_6163);
                };
                _SafeStr_6163++;
                _SafeStr_6165 = false;
                if (HabboGamesCom.logEnabled)
                {
                    HabboGamesCom.log(("Turn:" + _SafeStr_6163));
                };
            };
            _SafeStr_6164++;
            if (_SafeStr_6164 >= getNumberOfSubTurns())
            {
                _SafeStr_6164 = 0;
            };
        }

        public function addGameEvent(_arg_1:int, _arg_2:int, _arg_3:ISynchronizedGameEvent):void
        {
            var _local_4:Array = _SafeStr_6162[_arg_1];
            if (_local_4 == null)
            {
                _local_4 = initEmptyEventQueue();
                _SafeStr_6162[_arg_1] = _local_4;
            };
            _local_4[_arg_2].push(_arg_3);
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((("Add game event: " + _arg_3) + " (subturn/turn): ") + _arg_2) + "/") + _arg_1));
            };
        }

        public function debugEventQueue():void
        {
            var _local_5:int;
            var _local_1:* = null;
            var _local_6:int;
            var _local_4:* = null;
            var _local_2:String = "";
            _local_5 = 0;
            while (_local_5 < _SafeStr_6162.length)
            {
                _local_1 = _SafeStr_6162[_local_5];
                if (_local_1 != null)
                {
                    _local_6 = 0;
                    while (_local_6 < getNumberOfSubTurns())
                    {
                        _local_4 = _local_1[_local_6];
                        if (_local_4.length != 0)
                        {
                            _local_2 = (_local_2 + (((_local_5 + " (") + _local_6) + ") : "));
                            for each (var _local_3:ISynchronizedGameEvent in _local_4)
                            {
                                _local_2 = (_local_2 + _local_3);
                            };
                            _local_2 = (_local_2 + "\n");
                        };
                        _local_6++;
                    };
                };
                _local_5++;
            };
            HabboGamesCom.log(_local_2);
        }

        public function getNumberOfSubTurns():int
        {
            return (this.getExtension().getNumberOfSubTurns());
        }

        public function getTurnNumber():int
        {
            return (_SafeStr_6163);
        }

        public function get subturn():int
        {
            return (_SafeStr_6164);
        }

        public function getCurrentStage():_SafeStr_3309
        {
            return (_SafeStr_6167);
        }

        public function getExtension():IGameArenaExtension
        {
            return (_extension);
        }

        public function setExtension(_arg_1:IGameArenaExtension):void
        {
            _extension = _arg_1;
            _arg_1.gameArena = this;
        }

        public function getCheckSum(_arg_1:int):int
        {
            return (_checkSums[_arg_1]);
        }

        public function seekToTurn(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_6163 = _arg_1;
            _SafeStr_6164 = 0;
            _checkSums[_arg_1] = _arg_2;
            _SafeStr_6162 = [];
            _SafeStr_6162[_SafeStr_6163] = initEmptyEventQueue();
            _SafeStr_6165 = true;
        }

        private function initEmptyEventQueue():Array
        {
            var _local_1:int;
            var _local_2:Array = [];
            _local_1 = 0;
            while (_local_1 < getNumberOfSubTurns())
            {
                _local_2[_local_1] = [];
                _local_1++;
            };
            return (_local_2);
        }

        public function get numberOfTeams():int
        {
            return (_numberOfTeams);
        }

        private function resetTeamScores():void
        {
            var _local_1:int;
            _SafeStr_6168 = [];
            _local_1 = 0;
            while (_local_1 < _numberOfTeams)
            {
                _SafeStr_6168[_local_1] = 0;
                _local_1++;
            };
        }

        public function addTeamScore(_arg_1:int, _arg_2:int):void
        {
            if (((_arg_1 > 0) && (_arg_1 <= _numberOfTeams)))
            {
                var _local_3:* = (_arg_1 - 1);
                var _local_4:* = (_SafeStr_6168[_local_3] + _arg_2);
                _SafeStr_6168[_local_3] = _local_4;
            };
        }

        public function getTeamScores():Array
        {
            return (_SafeStr_6168);
        }


    }
}//package com.sulake.habbo.game.snowwar.arena

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_3310 = "_-M1m" (String#2514, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_5466 = "_-Z2" (String#393, DoABC#4)
// _SafeStr_6162 = "_-21W" (String#5440, DoABC#4)
// _SafeStr_6163 = "_-JJ" (String#4303, DoABC#4)
// _SafeStr_6164 = "_-B1A" (String#4584, DoABC#4)
// _SafeStr_6165 = "_-R3" (String#13577, DoABC#4)
// _SafeStr_6166 = "_-V1a" (String#28905, DoABC#4)
// _SafeStr_6167 = "_-I1S" (String#12817, DoABC#4)
// _SafeStr_6168 = "_-SQ" (String#3767, DoABC#4)


