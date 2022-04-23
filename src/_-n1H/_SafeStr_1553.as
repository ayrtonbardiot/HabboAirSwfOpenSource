// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-n1H._SafeStr_1553

package _-n1H
{
    import flash.utils.Dictionary;

    [SecureSWF(rename="true")]
    public class _SafeStr_1553 
    {

        public static const _SafeStr_7327:int = 0;
        public static const _SafeStr_7328:int = 1;
        public static const _SafeStr_7329:int = 2;
        public static const _SafeStr_7330:int = 3;
        public static const _SafeStr_7331:int = 4;
        public static const _SafeStr_7395:int = 0;
        public static const _SafeStr_7396:int = 1;
        public static const _SafeStr_7397:int = 2;

        private var _SafeStr_3693:int;
        private var _name:String;
        private var _description:String;
        private var _SafeStr_5023:int;
        private var _SafeStr_4674:int;
        private var _SafeStr_7398:int;
        private var _SafeStr_7399:int;
        private var _SafeStr_4429:Array;
        private var _SafeStr_5022:int;
        private var _SafeStr_7295:Boolean;
        private var _SafeStr_7400:Boolean;
        private var _SafeStr_7401:Boolean;
        private var _hideWalls:Boolean;
        private var _wallThickness:int;
        private var _floorThickness:int;
        private var _SafeStr_7402:Dictionary;
        private var _SafeStr_7403:Array;
        private var _SafeStr_7404:int;
        private var _SafeStr_7405:Dictionary;
        private var _SafeStr_7406:Array;
        private var _SafeStr_5016:_SafeStr_1625;
        private var _SafeStr_7049:_SafeStr_1626;
        private var _SafeStr_7407:Boolean;


        public static function getDoorModeLocalizationKey(_arg_1:int):String
        {
            switch (_arg_1)
            {
                case 0:
                    return ("${navigator.door.mode.open}");
                case 1:
                    return ("${navigator.door.mode.closed}");
                case 2:
                    return ("${navigator.door.mode.password}");
                case 3:
                    return ("${navigator.door.mode.invisible}");
                case 4:
                    return ("${navigator.door.mode.noobs_only}");
                default:
                    return ("");
            };
        }


        public function get tradeMode():int
        {
            return (_SafeStr_5022);
        }

        public function set tradeMode(_arg_1:int):void
        {
            _SafeStr_5022 = _arg_1;
        }

        public function get allowPets():Boolean
        {
            return (_SafeStr_7295);
        }

        public function set allowPets(_arg_1:Boolean):void
        {
            _SafeStr_7295 = _arg_1;
        }

        public function get allowFoodConsume():Boolean
        {
            return (_SafeStr_7400);
        }

        public function set allowFoodConsume(_arg_1:Boolean):void
        {
            _SafeStr_7400 = _arg_1;
        }

        public function get allowWalkThrough():Boolean
        {
            return (_SafeStr_7401);
        }

        public function set allowWalkThrough(_arg_1:Boolean):void
        {
            _SafeStr_7401 = _arg_1;
        }

        public function get hideWalls():Boolean
        {
            return (_hideWalls);
        }

        public function set hideWalls(_arg_1:Boolean):void
        {
            _hideWalls = _arg_1;
        }

        public function get wallThickness():int
        {
            return (_wallThickness);
        }

        public function set wallThickness(_arg_1:int):void
        {
            _wallThickness = _arg_1;
        }

        public function get floorThickness():int
        {
            return (_floorThickness);
        }

        public function set floorThickness(_arg_1:int):void
        {
            _floorThickness = _arg_1;
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function set roomId(_arg_1:int):void
        {
            _SafeStr_3693 = _arg_1;
        }

        public function get name():String
        {
            return (_name);
        }

        public function set name(_arg_1:String):void
        {
            _name = _arg_1;
        }

        public function get description():String
        {
            return (_description);
        }

        public function set description(_arg_1:String):void
        {
            _description = _arg_1;
        }

        public function get doorMode():int
        {
            return (_SafeStr_5023);
        }

        public function set doorMode(_arg_1:int):void
        {
            _SafeStr_5023 = _arg_1;
        }

        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function set categoryId(_arg_1:int):void
        {
            _SafeStr_4674 = _arg_1;
        }

        public function get maximumVisitors():int
        {
            return (_SafeStr_7398);
        }

        public function set maximumVisitors(_arg_1:int):void
        {
            _SafeStr_7398 = _arg_1;
        }

        public function get maximumVisitorsLimit():int
        {
            return (_SafeStr_7399);
        }

        public function set maximumVisitorsLimit(_arg_1:int):void
        {
            _SafeStr_7399 = _arg_1;
        }

        public function get tags():Array
        {
            return (_SafeStr_4429);
        }

        public function set tags(_arg_1:Array):void
        {
            _SafeStr_4429 = _arg_1;
        }

        public function setFlatController(_arg_1:int, _arg_2:_SafeStr_1628):void
        {
            if (_SafeStr_7402 != null)
            {
                _SafeStr_7402[_arg_1] = _arg_2;
                _SafeStr_7403 = null;
                _SafeStr_7404 = _arg_1;
            };
        }

        public function get roomModerationSettings():_SafeStr_1625
        {
            return (_SafeStr_5016);
        }

        public function set roomModerationSettings(_arg_1:_SafeStr_1625):void
        {
            _SafeStr_5016 = _arg_1;
        }

        public function get controllersById():Dictionary
        {
            return (_SafeStr_7402);
        }

        public function set controllersById(_arg_1:Dictionary):void
        {
            _SafeStr_7402 = _arg_1;
        }

        public function get controllerList():Array
        {
            var _local_3:int;
            var _local_2:* = null;
            if (_SafeStr_7403 == null)
            {
                _SafeStr_7403 = [];
                for (var _local_1:String in _SafeStr_7402)
                {
                    _local_3 = _local_1;
                    _local_2 = _SafeStr_7402[_local_3];
                    if (_local_2 != null)
                    {
                        _SafeStr_7403.push(_local_2);
                    };
                };
                _SafeStr_7403.sortOn("userName", 1);
            };
            return (_SafeStr_7403);
        }

        public function get highlightedUserId():int
        {
            return (_SafeStr_7404);
        }

        public function setBannedUser(_arg_1:int, _arg_2:_SafeStr_1639):void
        {
            if (_SafeStr_7405 == null)
            {
                _SafeStr_7405 = new Dictionary();
            }
            else
            {
                _SafeStr_7406 = null;
            };
            _SafeStr_7405[_arg_1] = _arg_2;
        }

        public function get bannedUsersById():Dictionary
        {
            return (_SafeStr_7405);
        }

        public function get bannedUsersList():Array
        {
            if (_SafeStr_7406 == null)
            {
                _SafeStr_7406 = [];
                for each (var _local_1:_SafeStr_1639 in _SafeStr_7405)
                {
                    _SafeStr_7406.push(_local_1);
                };
                _SafeStr_7406.sortOn("userName", 1);
            };
            return (_SafeStr_7406);
        }

        public function get chatSettings():_SafeStr_1626
        {
            return (_SafeStr_7049);
        }

        public function set chatSettings(_arg_1:_SafeStr_1626):void
        {
            _SafeStr_7049 = _arg_1;
        }

        public function get allowNavigatorDynamicCats():Boolean
        {
            return (_SafeStr_7407);
        }

        public function set allowNavigatorDynamicCats(_arg_1:Boolean):void
        {
            _SafeStr_7407 = _arg_1;
        }


    }
}//package _-n1H

// _SafeStr_1553 = "_-R1f" (String#8350, DoABC#3)
// _SafeStr_1625 = "_-Ug" (String#8591, DoABC#3)
// _SafeStr_1626 = "_-51" (String#6869, DoABC#3)
// _SafeStr_1628 = "_-m19" (String#9794, DoABC#3)
// _SafeStr_1639 = "_-O1B" (String#8133, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_4429 = "_-91w" (String#7179, DoABC#3)
// _SafeStr_4674 = "_-k10" (String#9658, DoABC#3)
// _SafeStr_5016 = "_-32x" (String#6760, DoABC#3)
// _SafeStr_5022 = "_-r8" (String#10148, DoABC#3)
// _SafeStr_5023 = "_-3h" (String#6786, DoABC#3)
// _SafeStr_7049 = "_-FY" (String#7569, DoABC#3)
// _SafeStr_7295 = "_-TQ" (String#8516, DoABC#3)
// _SafeStr_7327 = "_-u1u" (String#10328, DoABC#3)
// _SafeStr_7328 = "_-RM" (String#8374, DoABC#3)
// _SafeStr_7329 = "_-yn" (String#10647, DoABC#3)
// _SafeStr_7330 = "_-lt" (String#9786, DoABC#3)
// _SafeStr_7331 = "_-N1H" (String#8058, DoABC#3)
// _SafeStr_7395 = "_-mb" (String#9835, DoABC#3)
// _SafeStr_7396 = "_-m1Q" (String#9802, DoABC#3)
// _SafeStr_7397 = "_-iq" (String#9573, DoABC#3)
// _SafeStr_7398 = "_-DJ" (String#7446, DoABC#3)
// _SafeStr_7399 = "_-22B" (String#6662, DoABC#3)
// _SafeStr_7400 = "_-B1d" (String#7312, DoABC#3)
// _SafeStr_7401 = "_-h1Y" (String#9472, DoABC#3)
// _SafeStr_7402 = "_-Ui" (String#8592, DoABC#3)
// _SafeStr_7403 = "_-KC" (String#7907, DoABC#3)
// _SafeStr_7404 = "_-o6" (String#9943, DoABC#3)
// _SafeStr_7405 = "_-P2" (String#8251, DoABC#3)
// _SafeStr_7406 = "_-K1F" (String#7867, DoABC#3)
// _SafeStr_7407 = "_-O1r" (String#8162, DoABC#3)


