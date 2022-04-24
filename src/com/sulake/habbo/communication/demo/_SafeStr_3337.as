// by nota

//com.sulake.habbo.communication.demo._SafeStr_3337

package com.sulake.habbo.communication.demo
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.core.window._SafeStr_1694;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3284;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.utils.CommunicationUtils;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.net.Socket;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    [SecureSWF(rename="true")]
    public class _SafeStr_3337 extends EventDispatcherWrapper 
    {

        public static const ENVIRONMENT_SELECTED_EVENT:String = "ENVIRONMENT_SELECTED_EVENT";

        private var _SafeStr_5113:_SafeStr_19;
        private var _windowManager:_SafeStr_1694;
        private var _SafeStr_5107:IAssetLibrary;
        private var _SafeStr_6040:_SafeStr_3109;
        private var _SafeStr_6041:int;
        private var _SafeStr_6039:_SafeStr_3284;
        private var _SafeStr_6038:String;

        public function _SafeStr_3337(_arg_1:_SafeStr_3284, _arg_2:_SafeStr_19, _arg_3:_SafeStr_1694, _arg_4:IAssetLibrary)
        {
            _SafeStr_5113 = _arg_2;
            _windowManager = _arg_3;
            _SafeStr_5107 = _arg_4;
            _SafeStr_6039 = _arg_1;
            init();
        }

        public function get selectedEnvironment():String
        {
            return (_SafeStr_6038);
        }

        override public function dispose():void
        {
            _SafeStr_6039 = null;
            super.dispose();
        }

        private function getAvailableEnvironments():Array
        {
            return (_SafeStr_5113.getProperty("live.environment.list").split("/"));
        }

        private function createListItem(_arg_1:String):_SafeStr_3109
        {
            var _local_2:XmlAsset = (_SafeStr_5107.getAssetByName(_arg_1) as XmlAsset);
            return (_windowManager.buildFromXML((_local_2.content as XML)));
        }

        private function init():void
        {
            var _local_5:int;
            var _local_6:* = null;
            _SafeStr_6040 = createListItem("login_environment_list_item");
            var _local_3:Array = getAvailableEnvironments();
            var _local_1:String = CommunicationUtils.readSOLString("environment");
            _local_1 = ((_local_1 == null) ? "d63" : _local_1);
            var _local_4:Array = getEnvironmentNames(_local_3);
            _SafeStr_6038 = _local_1;
            var _local_7:int = _SafeStr_6039.numMenuItems;
            _local_5 = 0;
            while (_local_5 < _local_7)
            {
                _SafeStr_6039.removeMenuItemAt(0);
                _local_5++;
            };
            for each (var _local_2:String in _local_4)
            {
                _local_6 = (_SafeStr_6040.clone() as _SafeStr_3133);
                _local_6.findChildByName("title").caption = _local_2;
                _SafeStr_6039.addMenuItem(_local_6);
            };
            _SafeStr_6039.selection = _local_3.indexOf(_local_1);
            _SafeStr_6039.procedure = dropMenuEventHandler;
            _SafeStr_6041 = -1;
            testEnvironmentAvailable(false);
        }

        private function testEnvironmentAvailable(_arg_1:Boolean):void
        {
            var lastEnvironmentConnected = _arg_1;
            if ((((_disposed) || (_SafeStr_6039 == null)) || (_SafeStr_6039.disposed)))
            {
                return;
            };
            var environmentIds:Array = getAvailableEnvironments();
            if ((((_SafeStr_6039) && (_SafeStr_6041 > -1)) && (_SafeStr_6041 < _SafeStr_6039.numMenuItems)))
            {
                var window:_SafeStr_3133 = (_SafeStr_6039.getMenuItemAt(_SafeStr_6041) as _SafeStr_3133);
                (window.findChildByName("icon") as IStaticBitmapWrapperWindow).assetUri = ((lastEnvironmentConnected) ? "help_accept_icon" : "help_decline_icon");
            };
            _SafeStr_6041++;
            if (_SafeStr_6041 >= environmentIds.length)
            {
                return;
            };
            var environment:String = environmentIds[_SafeStr_6041];
            var host:String = _SafeStr_5113.getProperty(("connection.info.host." + environment));
            var ports:Array = _SafeStr_5113.getProperty(("connection.info.port." + environment)).split(",");
            var socket:Socket = new Socket();
            socket.addEventListener("connect", function (_arg_1:Event):void
            {
                (_arg_1.target as Socket).close();
                testEnvironmentAvailable(true);
            });
            socket.addEventListener("complete", function (_arg_1:Event):void
            {
                (_arg_1.target as Socket).close();
            });
            socket.addEventListener("close", function (_arg_1:Event):void
            {
                (_arg_1.target as Socket).close();
            });
            socket.addEventListener("socketData", function (_arg_1:ProgressEvent):void
            {
                (_arg_1.target as Socket).close();
            });
            socket.addEventListener("securityError", function (_arg_1:SecurityErrorEvent):void
            {
                (_arg_1.target as Socket).close();
                testEnvironmentAvailable(false);
            });
            socket.addEventListener("ioError", function (_arg_1:IOErrorEvent):void
            {
                (_arg_1.target as Socket).close();
                testEnvironmentAvailable(false);
            });
            socket.connect(host, ports[0]);
        }

        private function getEnvironmentNames(_arg_1:Array):Array
        {
            var _local_3:Array = [];
            for each (var _local_2:String in _arg_1)
            {
                _local_3.push(getEnvironmentName(_local_2));
            };
            return (_local_3);
        }

        public function getEnvironmentName(_arg_1:String):String
        {
            var _local_3:* = _arg_1;
            var _local_2:String = ("connection.info.name." + _arg_1);
            if (_SafeStr_5113.propertyExists(_local_2))
            {
                _local_3 = _SafeStr_5113.getProperty(_local_2);
            }
            else
            {
                _SafeStr_14.log(("Could not find name for environment: " + _arg_1));
            };
            return (_local_3);
        }

        private function dropMenuEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WE_SELECTED")
            {
                return;
            };
            var _local_4:Array = getAvailableEnvironments();
            var _local_5:int = _SafeStr_6039.selection;
            var _local_3:String = _local_4[_local_5];
            _SafeStr_6038 = _local_3;
            dispatchEvent(new Event("ENVIRONMENT_SELECTED_EVENT"));
            _arg_1.stopPropagation();
            _arg_1.stopImmediatePropagation();
        }


    }
}//package com.sulake.habbo.communication.demo

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1694 = "_-41e" (String#5816, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3284 = "_-21F" (String#5819, DoABC#4)
// _SafeStr_3337 = "_-u1Z" (String#11595, DoABC#4)
// _SafeStr_5107 = "_-j1u" (String#8231, DoABC#4)
// _SafeStr_5113 = "_-P1g" (String#4552, DoABC#4)
// _SafeStr_6038 = "_-F1B" (String#13202, DoABC#4)
// _SafeStr_6039 = "_-e6" (String#4871, DoABC#4)
// _SafeStr_6040 = "_-Dk" (String#22449, DoABC#4)
// _SafeStr_6041 = "_-Z1M" (String#6620, DoABC#4)


