/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
 'use strict';

 var { NativeAppEventEmitter } = require('react-native');

 var subscription = NativeAppEventEmitter.addListener(
   'EventReminder',
   (reminder) => console.log(reminder.name)
 );

 var React = require('react-native');
 var {
   AppRegistry,
   StyleSheet,
   Text,
   View,
   TouchableHighlight,
 } = React;
 var date=new Date();
 var CalendarManager=React.NativeModules.CalendarManager;

 var test1 = React.createClass({

   getInitialState() {
     return {

     };
   },

   _press:function(){
     subscription.remove();
     CalendarManager.findEvents((error, events) => {
    if (error) {
      console.error(error);
    } else {
      this.setState({events: events});
      console.log('qqqqqqqqqqqqqqq');
      }
    });
   },

   render: function() {
     return (
       <View style={styles.container}>
         <Text style={styles.welcome}>
           Welcome to React Native!
         </Text>
         <Text style={styles.instructions}>
           To get started, edit index.android.js
         </Text>
         <Text style={styles.instructions}>
           Shake or press menu button for dev menu
         </Text>
         <TouchableHighlight
         onPress={this._press}
         >
          <Text> touch me </Text>
         </TouchableHighlight>
       </View>
     );
   }
 });

 var styles = StyleSheet.create({
   container: {
     flex: 1,
     justifyContent: 'center',
     alignItems: 'center',
     backgroundColor: '#F5FCFF',
   },
   welcome: {
     fontSize: 20,
     textAlign: 'center',
     margin: 10,
   },
   instructions: {
     textAlign: 'center',
     color: '#333333',
     marginBottom: 5,
   },
 });

 AppRegistry.registerComponent('test1', () => test1);
