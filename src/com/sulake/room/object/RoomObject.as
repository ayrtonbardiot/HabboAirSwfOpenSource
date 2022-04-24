// by nota

//com.sulake.room.object.RoomObject

package com.sulake.room.object
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.visualization.IRoomObjectVisualization;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import com.sulake.room.utils.IVector3d;
    import com.sulake.room.object.logic.IRoomObjectMouseHandler;
    import com.sulake.room.utils.*;

    public class RoomObject implements IRoomObjectController 
    {

        private static var _SafeStr_4163:int = 0;

        private var _SafeStr_3820:int;
        private var _SafeStr_4028:String = "";
        private var _SafeStr_3985:Vector3d;
        private var _SafeStr_4049:Vector3d;
        private var _SafeStr_5605:Vector3d;
        private var _SafeStr_5606:Vector3d;
        private var _SafeStr_5604:Array;
        private var _SafeStr_4619:RoomObjectModel;
        private var _visualization:IRoomObjectVisualization;
        private var _SafeStr_5607:IRoomObjectEventHandler;
        private var _SafeStr_4165:int;
        private var _avatarLibraryAssetName:String;
        private var _SafeStr_4166:int = 0;
        private var _SafeStr_3883:Boolean = false;

        public function RoomObject(_arg_1:int, _arg_2:int, _arg_3:String)
        {
            var _local_4:Number;
            super();
            _SafeStr_3820 = _arg_1;
            _SafeStr_3985 = new Vector3d();
            _SafeStr_4049 = new Vector3d();
            _SafeStr_5605 = new Vector3d();
            _SafeStr_5606 = new Vector3d();
            _SafeStr_5604 = new Array(_arg_2);
            _local_4 = (_arg_2 - 1);
            while (_local_4 >= 0)
            {
                _SafeStr_5604[_local_4] = 0;
                _local_4--;
            };
            _SafeStr_4028 = _arg_3;
            _SafeStr_4619 = new RoomObjectModel();
            _visualization = null;
            _SafeStr_5607 = null;
            _SafeStr_4165 = 0;
            _SafeStr_4166 = _SafeStr_4163++;
        }

        public function dispose():void
        {
            _SafeStr_3985 = null;
            _SafeStr_4049 = null;
            _SafeStr_5604 = null;
            _avatarLibraryAssetName = null;
            setVisualization(null);
            setEventHandler(null);
            if (_SafeStr_4619 != null)
            {
                _SafeStr_4619.dispose();
                _SafeStr_4619 = null;
            };
        }

        public function setInitialized(_arg_1:Boolean):void
        {
            _SafeStr_3883 = _arg_1;
        }

        public function isInitialized():Boolean
        {
            return (_SafeStr_3883);
        }

        public function getId():int
        {
            return (_SafeStr_3820);
        }

        public function getInstanceId():int
        {
            return (_SafeStr_4166);
        }

        public function getType():String
        {
            return (_SafeStr_4028);
        }

        public function getLocation():IVector3d
        {
            _SafeStr_5605.assign(_SafeStr_3985);
            return (_SafeStr_5605);
        }

        public function getDirection():IVector3d
        {
            _SafeStr_5606.assign(_SafeStr_4049);
            return (_SafeStr_5606);
        }

        public function getModel():IRoomObjectModel
        {
            return (_SafeStr_4619);
        }

        public function getModelController():IRoomObjectModelController
        {
            return (_SafeStr_4619);
        }

        public function getState(_arg_1:int):int
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_5604.length)))
            {
                return (_SafeStr_5604[_arg_1]);
            };
            return (-1);
        }

        public function getVisualization():IRoomObjectVisualization
        {
            return (_visualization);
        }

        public function setLocation(_arg_1:IVector3d):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            if ((((!(_SafeStr_3985.x == _arg_1.x)) || (!(_SafeStr_3985.y == _arg_1.y))) || (!(_SafeStr_3985.z == _arg_1.z))))
            {
                _SafeStr_3985.x = _arg_1.x;
                _SafeStr_3985.y = _arg_1.y;
                _SafeStr_3985.z = _arg_1.z;
                _SafeStr_4165++;
            };
        }

        public function setDirection(_arg_1:IVector3d):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            if ((((!(_SafeStr_4049.x == _arg_1.x)) || (!(_SafeStr_4049.y == _arg_1.y))) || (!(_SafeStr_4049.z == _arg_1.z))))
            {
                _SafeStr_4049.x = (((_arg_1.x % 360) + 360) % 360);
                _SafeStr_4049.y = (((_arg_1.y % 360) + 360) % 360);
                _SafeStr_4049.z = (((_arg_1.z % 360) + 360) % 360);
                _SafeStr_4165++;
            };
        }

        public function setState(_arg_1:int, _arg_2:int):Boolean
        {
            if (((_arg_2 >= 0) && (_arg_2 < _SafeStr_5604.length)))
            {
                if (_SafeStr_5604[_arg_2] != _arg_1)
                {
                    _SafeStr_5604[_arg_2] = _arg_1;
                    _SafeStr_4165++;
                };
                return (true);
            };
            return (false);
        }

        public function setVisualization(_arg_1:IRoomObjectVisualization):void
        {
            if (_arg_1 != _visualization)
            {
                if (_visualization != null)
                {
                    _visualization.dispose();
                };
                _visualization = _arg_1;
                if (_visualization != null)
                {
                    _visualization.object = this;
                };
            };
        }

        public function setEventHandler(_arg_1:IRoomObjectEventHandler):void
        {
            if (_arg_1 == _SafeStr_5607)
            {
                return;
            };
            var _local_2:IRoomObjectEventHandler = _SafeStr_5607;
            if (_local_2 != null)
            {
                _SafeStr_5607 = null;
                _local_2.object = null;
            };
            _SafeStr_5607 = _arg_1;
            if (_SafeStr_5607 != null)
            {
                _SafeStr_5607.object = this;
            };
        }

        public function getEventHandler():IRoomObjectEventHandler
        {
            return (_SafeStr_5607);
        }

        public function getUpdateID():int
        {
            return (_SafeStr_4165);
        }

        public function getMouseHandler():IRoomObjectMouseHandler
        {
            return (getEventHandler());
        }

        public function getAvatarLibraryAssetName():String
        {
            if (!_avatarLibraryAssetName)
            {
                _avatarLibraryAssetName = ("avatar_" + getId());
            };
            return (_avatarLibraryAssetName);
        }

        public function tearDown():void
        {
            if (_SafeStr_5607)
            {
                _SafeStr_5607.tearDown();
            };
        }


    }
}//package com.sulake.room.object

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3985 = "_-Bg" (String#992, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4049 = "_-W12" (String#2181, DoABC#4)
// _SafeStr_4163 = "_-22t" (String#6166, DoABC#4)
// _SafeStr_4165 = "_-e1M" (String#1170, DoABC#4)
// _SafeStr_4166 = "_-jT" (String#4454, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_5604 = "_-y1J" (String#6791, DoABC#4)
// _SafeStr_5605 = "_-m1L" (String#15567, DoABC#4)
// _SafeStr_5606 = "_-50" (String#14949, DoABC#4)
// _SafeStr_5607 = "_-gq" (String#5301, DoABC#4)


