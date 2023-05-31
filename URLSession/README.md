
# Making a GET Request for Songs from API
### (Apple Music API)
```swift
//

//  ContentView.swift

//  apiTesting

//

//  Created by Joe Zoll on 5/30/23.

//

  

**import** SwiftUI

  

**struct** Response: Codable {

    **var** results: [Result]

}

  

**struct** Result: Codable {

    **var** trackId: Int

    **var** trackName: String

    **var** collectionName: String

}

  

**struct** ContentView: View {

    @State **private** **var** results = [Result]()

    **var** body: **some** View {

        List(results, id:\.trackId) { item **in**

            VStack(alignment: .leading) {

                Text(item.trackName).font(.headline)

                Text(item.collectionName)

            }

        }.task {

            **await** loadData()

        }

    }

    **func** loadData() **async** {

        **guard** **let** url = URL(string: "https://itunes.apple.com/search?term=kanye+west&entity=song")

        **else** {

            print("Invalid URL")

            **return**

        }

        **do** {

            **let** (data, _) = **try** **await**

            URLSession.shared.data(from: url)

            **if** **let** decodedResponse = **try**? JSONDecoder().decode(Response.**self**, from: data) {

                results = decodedResponse.results

            }

        } **catch** {

            print("Invalid Data")

        }

    }

}

  

**struct** ContentView_Previews: PreviewProvider {

    **static** **var** previews: **some** View {

        ContentView()

    }

}
```

# Making a GET request from a dummy API
### https://jsonplaceholder.typicode.com

For this GET request, I did things a little bit differently from the tutorial I followed. The code is more sanctioned off into sections, which is more to my taste.

Just like with the Apple Music API, we get a simple JSON object that we use to print.

```swift
**private** **func** getJSONData(url_string: String) {

    // Check URL is valid

    **guard** **let** url = URL(string: url_string)

    **else** {

        print("Invalid URL.")

        **return**

    }

    **let** session = URLSession.shared

    **let** task = session.dataTask(with: url) {(data, response, error) **in**

        **if** **let** error = error {

            print("Error: \(error)")

            **return**

        }

        // Check if Response was recieved

        **guard** **let** response = response **as**? HTTPURLResponse **else** {

            print("Invalid Response.")

            **return**

        }

        // Check Status code

        **guard**(200...299).contains(response.statusCode) **else** {

            print("Invalid Status Code: \(response.statusCode)")

            **return**

        }

        // Check if data was received

        **guard** **let** data = data **else** {

            print("Invalid Data. No Data received.")

            **return**

        }

        // Convert data to string and print it

        **let** dataString = String(data: data, encoding: .utf8)

        print("Data: \(dataString)")

        print("Type: \(type(of:dataString))\n")

        **do** {

            **let** dataJson = **try** JSONSerialization.jsonObject(with: data)

            print("Data JSON:\n \(dataJson)")

            print("Type: \(type(of:dataJson))")

            **if** **let** jsonDictionary = dataJson **as**? [String: **Any**],

               **let** title = jsonDictionary["title"] **as**? String {

                torque = title

            }

        } **catch** {

            print("Error converting data to JSON format: \(error)")

        }

        //torque = dataString ??

    }

    task.resume()

}

```

