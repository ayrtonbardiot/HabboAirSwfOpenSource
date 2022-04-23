// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.RoomInstance

package com.sulake.room
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.renderer.IRoomRendererBase;
    import flash.utils.getTimer;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectController;

    public class RoomInstance implements IRoomInstance 
    {

        private var _SafeStr_4603:Dictionary;
        private var _SafeStr_4604:Dictionary;
        private var _SafeStr_4605:Array;
        private var _SafeStr_4606:Array;
        private var _managers:_SafeStr_24;
        private var _SafeStr_3737:Array;
        private var _SafeStr_4602:IRoomRendererBase;
        private var _container:IRoomInstanceContainer;
        private var _SafeStr_3820:String;

        public function RoomInstance(_arg_1:String, _arg_2:IRoomInstanceContainer)
        {
            _managers = new _SafeStr_24();
            _SafeStr_3737 = [];
            _container = _arg_2;
            _SafeStr_3820 = _arg_1;
            _SafeStr_4603 = new Dictionary();
            _SafeStr_4604 = new Dictionary();
            _SafeStr_4605 = [];
            _SafeStr_4606 = [];
        }

        public function get id():String
        {
            return (_SafeStr_3820);
        }

        public function dispose():void
        {
            var _local_2:int;
            var _local_1:* = null;
            var _local_3:* = null;
            if (_managers != null)
            {
                _local_2 = 0;
                while (_local_2 < _managers.length)
                {
                    _local_1 = (_managers.getWithIndex(_local_2) as IRoomObjectManager);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _managers.dispose();
                _managers = null;
            };
            if (_SafeStr_4602 != null)
            {
                _SafeStr_4602.dispose();
                _SafeStr_4602 = null;
            };
            _container = null;
            _SafeStr_3737 = null;
            if (_SafeStr_4603 != null)
            {
                for (_local_3 in _SafeStr_4603)
                {
                    delete _SafeStr_4603[_local_3];
                };
                _SafeStr_4603 = null;
            };
            if (_SafeStr_4604 != null)
            {
                for (_local_3 in _SafeStr_4604)
                {
                    delete _SafeStr_4604[_local_3];
                };
                _SafeStr_4604 = null;
            };
            _SafeStr_4606 = [];
            _SafeStr_4605 = [];
        }

        public function getNumber(_arg_1:String):Number
        {
            return (_SafeStr_4603[_arg_1]);
        }

        public function setNumber(_arg_1:String, _arg_2:Number, _arg_3:Boolean=false):void
        {
            if (_SafeStr_4605.indexOf(_arg_1) >= 0)
            {
                return;
            };
            if (_arg_3)
            {
                _SafeStr_4605.push(_arg_1);
            };
            if (_SafeStr_4603[_arg_1] != _arg_2)
            {
                _SafeStr_4603[_arg_1] = _arg_2;
            };
        }

        public function getString(_arg_1:String):String
        {
            return (_SafeStr_4604[_arg_1]);
        }

        public function setString(_arg_1:String, _arg_2:String, _arg_3:Boolean=false):void
        {
            if (_SafeStr_4606.indexOf(_arg_1) >= 0)
            {
                return;
            };
            if (_arg_3)
            {
                _SafeStr_4606.push(_arg_1);
            };
            if (_SafeStr_4604[_arg_1] != _arg_2)
            {
                _SafeStr_4604[_arg_1] = _arg_2;
            };
        }

        public function addObjectUpdateCategory(_arg_1:int):void
        {
            var _local_2:int = _SafeStr_3737.indexOf(_arg_1);
            if (_local_2 >= 0)
            {
                return;
            };
            _SafeStr_3737.push(_arg_1);
        }

        public function removeObjectUpdateCategory(_arg_1:int):void
        {
            var _local_2:int = _SafeStr_3737.indexOf(_arg_1);
            if (_local_2 >= 0)
            {
                _SafeStr_3737.splice(_local_2, 1);
            };
        }

        public function update():void
        {
            var _local_3:int;
            var _local_6:int;
            var _local_2:* = null;
            var _local_4:int;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_1:int = getTimer();
            _local_3 = (_SafeStr_3737.length - 1);
            while (_local_3 >= 0)
            {
                _local_6 = _SafeStr_3737[_local_3];
                _local_2 = getObjectManager(_local_6);
                if (_local_2 != null)
                {
                    _local_4 = (_local_2.getObjectCount() - 1);
                    while (_local_4 >= 0)
                    {
                        _local_7 = _local_2.getObjectWithIndex(_local_4);
                        if (_local_7 != null)
                        {
                            _local_5 = _local_7.getEventHandler();
                            if (_local_5 != null)
                            {
                                _local_5.update(_local_1);
                            };
                        };
                        _local_4--;
                    };
                };
                _local_3--;
            };
        }

        public function createRoomObject(_arg_1:int, _arg_2:String, _arg_3:int):IRoomObject
        {
            if (_container != null)
            {
                return (_container.createRoomObject(_SafeStr_3820, _arg_1, _arg_2, _arg_3));
            };
            return (null);
        }

        public function createObjectInternal(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObject
        {
            var _local_6:* = null;
            var _local_5:IRoomObjectManager = createObjectManager(_arg_4);
            if (_local_5 != null)
            {
                _local_6 = _local_5.createObject(_arg_1, _arg_2, _arg_3);
                if (_SafeStr_4602 != null)
                {
                    _SafeStr_4602.feedRoomObject(_local_6);
                };
                return (_local_6);
            };
            return (null);
        }

        public function getObject(_arg_1:int, _arg_2:int):IRoomObject
        {
            var _local_3:IRoomObjectManager = getObjectManager(_arg_2);
            if (_local_3 != null)
            {
                return (_local_3.getObject(_arg_1));
            };
            return (null);
        }

        public function getObjects(_arg_1:int):Array
        {
            var _local_2:IRoomObjectManager = getObjectManager(_arg_1);
            return ((_local_2) ? _local_2.getObjects() : []);
        }

        public function getObjectWithIndex(_arg_1:int, _arg_2:int):IRoomObject
        {
            var _local_3:IRoomObjectManager = getObjectManager(_arg_2);
            if (_local_3 != null)
            {
                return (_local_3.getObjectWithIndex(_arg_1));
            };
            return (null);
        }

        public function getObjectCount(_arg_1:int):int
        {
            var _local_2:IRoomObjectManager = getObjectManager(_arg_1);
            if (_local_2 != null)
            {
                return (_local_2.getObjectCount());
            };
            return (0);
        }

        public function getObjectWithIndexAndType(_arg_1:int, _arg_2:String, _arg_3:int):IRoomObject
        {
            var _local_4:IRoomObjectManager = getObjectManager(_arg_3);
            if (_local_4 != null)
            {
                return (_local_4.getObjectWithIndexAndType(_arg_1, _arg_2));
            };
            return (null);
        }

        public function getObjectCountForType(_arg_1:String, _arg_2:int):int
        {
            var _local_3:IRoomObjectManager = getObjectManager(_arg_2);
            if (_local_3 != null)
            {
                return (_local_3.getObjectCountForType(_arg_1));
            };
            return (0);
        }

        public function disposeObject(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_4:* = null;
            var _local_3:IRoomObjectManager = getObjectManager(_arg_2);
            if (_local_3 != null)
            {
                _local_4 = _local_3.getObject(_arg_1);
                if (_local_4 != null)
                {
                    _local_4.tearDown();
                    if (_SafeStr_4602)
                    {
                        _SafeStr_4602.removeRoomObject(_local_4);
                    };
                    return (_local_3.disposeObject(_arg_1));
                };
            };
            return (false);
        }

        public function disposeObjects(_arg_1:int):int
        {
            var _local_4:int;
            var _local_5:* = null;
            var _local_3:int;
            var _local_2:IRoomObjectManager = getObjectManager(_arg_1);
            if (_local_2 != null)
            {
                _local_3 = _local_2.getObjectCount();
                _local_4 = 0;
                while (_local_4 < _local_3)
                {
                    _local_5 = (_local_2.getObjectWithIndex(_local_4) as IRoomObjectController);
                    if (_local_5 != null)
                    {
                        if (_SafeStr_4602)
                        {
                            _SafeStr_4602.removeRoomObject(_local_5);
                        };
                        _local_5.dispose();
                    };
                    _local_4++;
                };
                _local_2.reset();
            };
            return (_local_3);
        }

        public function setRenderer(_arg_1:IRoomRendererBase):void
        {
            var _local_3:int;
            var _local_6:int;
            var _local_2:int;
            var _local_4:int;
            var _local_7:* = null;
            if (_arg_1 == _SafeStr_4602)
            {
                return;
            };
            if (_SafeStr_4602 != null)
            {
                _SafeStr_4602.dispose();
            };
            _SafeStr_4602 = _arg_1;
            if (_SafeStr_4602 == null)
            {
                return;
            };
            _SafeStr_4602.reset();
            var _local_5:Array = getObjectManagerIds();
            _local_3 = (_local_5.length - 1);
            while (_local_3 >= 0)
            {
                _local_6 = _local_5[_local_3];
                _local_2 = getObjectCount(_local_6);
                _local_4 = (_local_2 - 1);
                while (_local_4 >= 0)
                {
                    _local_7 = (getObjectWithIndex(_local_4, _local_6) as IRoomObjectController);
                    if (_local_7 != null)
                    {
                        _SafeStr_4602.feedRoomObject(_local_7);
                    };
                    _local_4--;
                };
                _local_3--;
            };
        }

        public function getRenderer():IRoomRendererBase
        {
            return (_SafeStr_4602);
        }

        public function getObjectManagerIds():Array
        {
            return (_managers.getKeys());
        }

        protected function createObjectManager(_arg_1:int):IRoomObjectManager
        {
            var _local_3:String = String(_arg_1);
            if (_managers.getValue(_local_3) != null)
            {
                return (_managers.getValue(_local_3) as IRoomObjectManager);
            };
            if (_container == null)
            {
                return (null);
            };
            var _local_2:IRoomObjectManager = _container.createRoomObjectManager();
            if (_local_2 != null)
            {
                _managers.add(_local_3, _local_2);
            };
            return (_local_2);
        }

        protected function getObjectManager(_arg_1:int):IRoomObjectManager
        {
            return (_managers.getValue(String(_arg_1)) as IRoomObjectManager);
        }

        protected function disposeObjectManager(_arg_1:int):Boolean
        {
            var _local_2:* = null;
            var _local_3:String = String(_arg_1);
            disposeObjects(_arg_1);
            if (_managers.getValue(_local_3) != null)
            {
                _local_2 = (_managers.remove(_local_3) as IRoomObjectManager);
                if (_local_2 != null)
                {
                    _local_2.dispose();
                };
                return (true);
            };
            return (false);
        }

        public function hasUninitializedObjects():Boolean
        {
            var _local_1:int;
            var _local_3:int;
            for each (var _local_2:RoomObjectManager in _managers)
            {
                _local_1 = _local_2.getObjectCount();
                _local_3 = 0;
                while (_local_3 < _local_1)
                {
                    if (!_local_2.getObjectWithIndex(_local_3).isInitialized())
                    {
                        return (true);
                    };
                    _local_3++;
                };
            };
            return (false);
        }


    }
}//package com.sulake.room

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3737 = "_-lm" (String#3571, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4602 = "_-61o" (String#2385, DoABC#4)
// _SafeStr_4603 = "_-m1n" (String#3490, DoABC#4)
// _SafeStr_4604 = "_-AW" (String#3465, DoABC#4)
// _SafeStr_4605 = "_-Ek" (String#5456, DoABC#4)
// _SafeStr_4606 = "_-vB" (String#5213, DoABC#4)


