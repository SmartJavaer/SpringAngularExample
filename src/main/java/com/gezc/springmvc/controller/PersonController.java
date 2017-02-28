package com.gezc.springmvc.controller;

import com.gezc.springmvc.model.User;
import com.gezc.springmvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

@RestController
public class PersonController {
 
    @Autowired
    UserService userService;

    @RequestMapping(value = "/person/", method = RequestMethod.GET)
    public ResponseEntity<List<User>> listAllUsers() {
        List<User> users = userService.findAllUsers();
        if(users.isEmpty()){
            return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<User>>(users, HttpStatus.OK);
    }

    @RequestMapping(value = "/person/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getPerson(@PathVariable("id") long id) {
        System.out.println("Fetching User with id " + id);
        User person = userService.findById(id);
        if (person == null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<User>(person, HttpStatus.OK);
    }

    @RequestMapping(value = "/person/", method = RequestMethod.POST)
    public ResponseEntity<Void> createPerson(@RequestBody User person,  UriComponentsBuilder ucBuilder) {
        System.out.println("Creating User " + person.getUsername());

        if (userService.isUserExist(person)) {
            System.out.println("A User with name " + person.getUsername() + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }

        userService.saveUser(person);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/person/{id}").buildAndExpand(person.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/person/{id}", method = RequestMethod.PUT)
    public ResponseEntity<User> updatePerson(@PathVariable("id") long id, @RequestBody User person) {
        System.out.println("Updating User " + id);

        User currentUser = userService.findById(id);

        if (currentUser==null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }

        currentUser.setUsername(person.getUsername());
        currentUser.setAddress(person.getAddress());
        currentUser.setEmail(person.getEmail());

        userService.updateUser(currentUser);
        return new ResponseEntity<User>(currentUser, HttpStatus.OK);
    }

    @RequestMapping(value = "/person/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<User> deletePerson(@PathVariable("id") long id) {
        System.out.println("Fetching & Deleting User with id " + id);

        User person = userService.findById(id);
        if (person == null) {
            System.out.println("Unable to delete. User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }

        userService.deleteUserById(id);
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }

    @RequestMapping(value = "/person/", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteAllPersons() {
        System.out.println("Deleting All Users");

        userService.deleteAllUsers();
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }
}