﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.arena._SafeStr_3309

package com.sulake.habbo.game.snowwar.arena
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.runtime.exceptions.Exception;
    import com.sulake.habbo.game.snowwar.utils.QuickRandom;
    import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;

    public class _SafeStr_3309 extends DefaultGameStage 
    {

        protected var _SafeStr_5732:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_5734:Array = [];
        private var _SafeStr_5733:Array = [];


        private static function zeroPad2digit(_arg_1:int):String
        {
            if (_arg_1 < 10)
            {
                return ("0" + _arg_1);
            };
            return (_arg_1.toString());
        }


        override public function dispose():void
        {
            super.dispose();
            if (_SafeStr_5732 != null)
            {
                for each (var _local_1:ISynchronizedGameObject in _SafeStr_5732)
                {
                    _local_1.dispose();
                };
                _SafeStr_5732.dispose();
                _SafeStr_5732 = null;
            };
            _SafeStr_5734 = [];
            _SafeStr_5733 = [];
        }

        public function addGameObject(_arg_1:int, _arg_2:ISynchronizedGameObject):void
        {
            _SafeStr_5732.add(_arg_1, _arg_2);
            _arg_2.isActive = true;
        }

        public function addInactiveGameObject(_arg_1:int, _arg_2:ISynchronizedGameObject):void
        {
            _SafeStr_5732.add(_arg_1, _arg_2);
            _arg_2.isActive = false;
        }

        public function addGameObjectById(_arg_1:int, _arg_2:ISynchronizedGameObject):void
        {
            _SafeStr_5732.add(_arg_1, _arg_2);
            _arg_2.isActive = true;
            if (_arg_2.gameObjectId != _arg_1)
            {
                throw (new Exception(("Could not add gameobject with id:" + _arg_1)));
            };
        }

        public function removeGameObject(_arg_1:int):void
        {
            var _local_2:ISynchronizedGameObject = _SafeStr_5732.remove(_arg_1);
            if (_local_2)
            {
                _local_2.onRemove();
                _SafeStr_5733.push(_local_2);
            };
        }

        public function removeAllGameObjects():void
        {
            for each (var _local_1:ISynchronizedGameObject in _SafeStr_5732.getValues())
            {
                _local_1.onRemove();
                _SafeStr_5733.push(_local_1);
            };
            _SafeStr_5732 = new _SafeStr_24();
        }

        public function putGameObjectOnDeleteList(_arg_1:ISynchronizedGameObject):void
        {
            if (_arg_1 == null)
            {
                HabboGamesCom.log("Trying to put null in delete list.");
                return;
            };
            _SafeStr_5734.push(_arg_1);
            _arg_1.isActive = false;
        }

        public function getGameObject(_arg_1:int):ISynchronizedGameObject
        {
            return (_SafeStr_5732.getValue(_arg_1) as ISynchronizedGameObject);
        }

        public function getGameObjects():Array
        {
            return (_SafeStr_5732.getValues());
        }

        public function subturn():void
        {
            for each (var _local_2:ISynchronizedGameObject in _SafeStr_5732.getValues())
            {
                _local_2.subturn(this);
            };
            if (_SafeStr_5734.length > 0)
            {
                for each (var _local_1:IGameObject in _SafeStr_5734)
                {
                    this.removeGameObject(_local_1.gameObjectId);
                };
                _SafeStr_5734 = [];
            };
        }

        public function calculateChecksum(_arg_1:int):int
        {
            var _local_7:int;
            var _local_5:int;
            var _local_2:int;
            var _local_6:int = QuickRandom.iterateSeed(_arg_1);
            var _local_8:int = 1;
            var _local_9:int;
            var _local_4:String = "";
            var _local_3:String = "";
            if (((HabboGamesCom.logEnabled) && ((_arg_1 % _local_8) == 0)))
            {
                _local_4 = "";
                _local_4 = (_local_4 + (("\nturn ### " + _arg_1) + " ###\n"));
                _local_4 = (_local_4 + (("seed " + _local_6) + "\n"));
                _local_3 = "";
            };
            for each (var _local_10:ISynchronizedGameObject in _SafeStr_5732)
            {
                if (((_local_10.isGhost) && (_local_10 is HumanGameObject)))
                {
                    HumanGameObject(_local_10).addGhostLocation(_arg_1);
                }
                else
                {
                    if (!((!(_local_10.isActive)) || (_local_10.isGhost)))
                    {
                        _local_7 = 1;
                        _local_5 = _local_10.numberOfVariables;
                        _local_2 = 0;
                        while (_local_2 < _local_5)
                        {
                            _local_6 = (_local_6 + (_local_10.getVariable(_local_2) * _local_7));
                            _local_7++;
                            if (((HabboGamesCom.logEnabled) && ((_arg_1 % _local_8) == 0)))
                            {
                                _local_3 = (_local_3 + _local_10.getVariable(_local_2));
                                if (_local_2 < (_local_5 - 1))
                                {
                                    _local_3 = (_local_3 + ",");
                                };
                            };
                            _local_2++;
                        };
                        if (((HabboGamesCom.logEnabled) && ((_arg_1 % _local_8) == 0)))
                        {
                            _local_4 = (_local_4 + (((((('++ "O' + zeroPad2digit((_local_9 + 1))) + "-CS:") + _local_6) + " Parms:") + _local_3) + '"\n'));
                            _local_3 = "";
                            _local_9++;
                        };
                    };
                };
            };
            if ((_arg_1 % _local_8) == 0)
            {
                HabboGamesCom.log(_local_4.toString());
            };
            return (_local_6);
        }

        public function appendGameObjects(_arg_1:Object):void
        {
            var _local_3:* = null;
            var _local_2:int;
            for each (_local_3 in _SafeStr_5732.getValues())
            {
                if (_local_3.isActive)
                {
                    _local_2++;
                };
            };
            _arg_1.writeInt(_local_2);
            for each (_local_3 in _SafeStr_5732.getValues())
            {
                if (_local_3.isActive)
                {
                };
            };
        }

        public function resetRemovedGameObjects():Array
        {
            var _local_1:Array = _SafeStr_5733;
            _SafeStr_5733 = [];
            return (_local_1);
        }


    }
}//package com.sulake.habbo.game.snowwar.arena

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3309 = "_-tx" (String#2281, DoABC#4)
// _SafeStr_5732 = "_-AT" (String#3275, DoABC#4)
// _SafeStr_5733 = "_-Y14" (String#7700, DoABC#4)
// _SafeStr_5734 = "_-E17" (String#7212, DoABC#4)


